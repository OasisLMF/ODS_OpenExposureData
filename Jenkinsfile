node {
    hasFailed = false
    sh 'sudo /var/lib/jenkins/jenkins-chown'
    deleteDir() // wipe out the workspace

    properties([
      parameters([
        [$class: 'StringParameterDefinition',  description: "Oasis Build scripts branch",        name: 'BUILD_BRANCH', defaultValue: 'master'],
        [$class: 'StringParameterDefinition',  name: 'ODS_BRANCH', defaultValue: BRANCH_NAME],
        [$class: 'StringParameterDefinition',  name: 'PUBLISH_VERSION', defaultValue: ''],
        [$class: 'StringParameterDefinition',  description: "Jenkins credential for GPG",        name: 'GPG_KEY', defaultValue: 'gpg-privatekey'],
        [$class: 'StringParameterDefinition',  description: "Jenkins credential for passphrase", name: 'GPG_PASSPHRASE', defaultValue: 'gpg-passphrase'],
        [$class: 'StringParameterDefinition',  description: "Jenkins credentials Twine",         name: 'TWINE_ACCOUNT', defaultValue: 'sams_twine_account'],
        [$class: 'BooleanParameterDefinition', description: "Mark as pre-released software",  name: 'PRE_RELEASE', defaultValue: Boolean.valueOf(true)],
        [$class: 'BooleanParameterDefinition', name: 'PUBLISH', defaultValue: Boolean.valueOf(false)],
        [$class: 'BooleanParameterDefinition', name: 'GH_PAGES', defaultValue: Boolean.valueOf(false)],
        [$class: 'BooleanParameterDefinition', name: 'AUTO_MERGE', defaultValue: Boolean.valueOf(true)],
        [$class: 'BooleanParameterDefinition', name: 'SLACK_MESSAGE', defaultValue: Boolean.valueOf(false)]
      ])
    ])

    //String Vars
    hasFailed = false
    String git_creds  = "1335b248-336a-47a9-b0f6-9f7314d6f1f4"
    String ods_git    = "git@github.com:OasisLMF/OpenDataStandards.git"
    String ods_branch = params.ODS_BRANCH
    String ods_dir    = "oasis_ods_build"
    String ods_pages  = "oasis_ods_pages"

    String twine_account = params.TWINE_ACCOUNT
    String gpg_key       = params.GPG_KEY
    String gpg_pass      = params.GPG_PASSPHRASE

    // Build vars   
    String build_repo = 'git@github.com:OasisLMF/build.git'
    String build_branch = params.BUILD_BRANCH
    String build_workspace = 'oasis_build'
    String script_dir = env.WORKSPACE + "/" + build_workspace
    String utils_sh        = '/buildscript/utils.sh'
    String PIPELINE = script_dir + "/buildscript/pipeline.sh"



    //make sure release candidate versions are tagged correctly
    if (params.PUBLISH && params.PRE_RELEASE && ! params.PUBLISH_VERSION.matches('^(\\d+\\.)(\\d+\\.)(\\*|\\d+)rc(\\d+)$')) {
        sh "echo release candidates must be tagged {version}rc{N}, example: 1.0.0rc1"
        sh "exit 1"
    }

    //Env vars
    env.TAG_RELEASE = params.PUBLISH_VERSION
    env.PIPELINE_LOAD =  script_dir + utils_sh

    try {
        parallel(
            clone_ods: {
                stage('Clone: OpenDataStandards') {
                    sshagent (credentials: [git_creds]) {
                        dir(ods_dir) {
                            sh "git clone -b ${ods_branch} ${ods_git} ."
                        }
                    }
                }
            },
            clone_build: {
                stage('Clone: ' + build_workspace) {
                    dir(build_workspace) {
                       git url: build_repo, credentialsId: git_creds, branch: build_branch
                    }   
                }   
            } 
        )


        if (params.PUBLISH) {
            stage('Set package version'){
                dir(ods_dir) {
                    cmd_string =  "sed -i \'1c__version__ = \"" + params.PUBLISH_VERSION + "\"\' src/__init__.py"
                    sh cmd_string
                }
            }
        }

        stage('Run: ODS-tools Build') {
              dir(ods_dir) {
                  //sh 'docker build -f docker/Dockerfile.oasis_docbuilder -t oed_doc_builder .'
                  //sh 'docker run -v $(pwd):/tmp/output oed_doc_builder:latest'
                  sh 'docker build --no-cache -f docker/Dockerfile.build_package -t ods-builder .'
                  sh 'docker run -v $(pwd)/dist:/home/dist  ods-builder'
              }
        }



        //if (params.GH_PAGES){
        //    stage('Publish: GitHub Pages') {
        //        dir(ods_pages) {
        //            sshagent (credentials: [git_creds]) {
        //                // Copy github pages branch
        //                sh "git clone -b gh_pages ${ods_git} ."

        //                // Extract new html & push
        //                sh "tar -zxvf ${env.WORKSPACE}/${ods_dir}/oed_docs.tar.gz -C ."
        //                sh "git add *"
        //                sh "git status"
        //                sh "git commit -m 'Update documenation - v${params.PUBLISH_VERSION}'"
        //                sh "git push"
        //            }
        //        }
        //    }
        //}

        if(params.PUBLISH){
            stage('Sign Package: ods-tools') {
                sh 'sudo /var/lib/jenkins/jenkins-chown'
                String gpg_dir='/var/lib/jenkins/.gnupg/'
                sh "if test -d ${gpg_dir}; then rm -r ${gpg_dir}; fi"
                withCredentials([file(credentialsId: gpg_key, variable: 'FILE')]) {
                    sh 'gpg --import $FILE'
                    sh 'gpg --list-keys'
                    withCredentials([string(credentialsId: gpg_pass, variable: 'PASSPHRASE')]) {
                        dir(ods_dir) {
                            sh PIPELINE + ' sign_ods_tools'
                        }
                    }
                }
                // delete GPG key from jenkins account
                sh "rm -r ${gpg_dir}"
            }
            stage ('Publish: ods-tools') {
                dir(ods_dir) {
                    // Publish package
                    withCredentials([usernamePassword(credentialsId: twine_account, usernameVariable: 'TWINE_USERNAME', passwordVariable: 'TWINE_PASSWORD')]) {
                        sh PIPELINE + ' push_ods_tools'
                    }
                }
            }

            stage('Publish: GitHub') {
                dir(ods_dir) {
                    sshagent (credentials: [git_creds]) {
                        sh "git tag ${env.TAG_RELEASE}"
                        sh "git push origin ${env.TAG_RELEASE}"
                    }

                    // Create Release
                    withCredentials([string(credentialsId: 'github-api-token', variable: 'gh_token')]) {
                        String repo = "OasisLMF/OpenDataStandards"

                        def json_request = readJSON text: '{}'
                        json_request['tag_name'] = env.TAG_RELEASE
                        json_request['target_commitish'] = 'master'
                        json_request['name'] = env.TAG_RELEASE
                        json_request['body'] = ""
                        json_request['draft'] = false
                        json_request['prerelease'] = params.PRE_RELEASE
                        writeJSON file: 'gh_request.json', json: json_request
                        sh 'curl -XPOST -H "Authorization:token ' + gh_token + "\" --data @gh_request.json https://api.github.com/repos/$repo/releases >  gh_response.json"
                    }
                }
            }
        }
    } catch(hudson.AbortException | org.jenkinsci.plugins.workflow.steps.FlowInterruptedException buildException) {
        hasFailed = true
        error('Build Failed')
    } finally {
        if(params.SLACK_MESSAGE && (params.PUBLISH || hasFailed)){
            def slackColor = hasFailed ? '#FF0000' : '#27AE60'
            SLACK_MSG = "*${env.JOB_NAME}* - (<${env.BUILD_URL}|${env.RELEASE_TAG}>): " + (hasFailed ? 'FAILED' : 'PASSED')
            SLACK_MSG += "\nMode: " + (params.PUBLISH ? 'Publish' : 'Build Test')
            SLACK_CHAN = (params.PUBLISH ? "#builds-release":"#builds-dev")
            slackSend(channel: SLACK_CHAN, message: SLACK_MSG, color: slackColor)
        }

        //// Store build output
        //dir(ods_dir) {
        //    archiveArtifacts artifacts: 'dist/*.tar.gz'
        //    archiveArtifacts artifacts: '*.pdf'
        //}

        // Run merge back if publish
        if (params.PUBLISH && params.AUTO_MERGE && ! hasFailed && ! params.PRE_RELEASE){
            dir(ods_dir) {
                sshagent (credentials: [git_creds]) {
                    sh "git stash"
                    sh "git checkout master && git pull"
                    sh "git merge ${ods_branch} && git push"
                    sh "git checkout develop && git pull"
                    sh "git merge master && git push"
                }
            }
        }
    }
}
