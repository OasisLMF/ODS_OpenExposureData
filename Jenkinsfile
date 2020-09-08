node {
    hasFailed = false
    sh 'sudo /var/lib/jenkins/jenkins-chown'
    deleteDir() // wipe out the workspace

    properties([
      parameters([
        [$class: 'StringParameterDefinition',  name: 'ODS_BRANCH', defaultValue: BRANCH_NAME],
        [$class: 'StringParameterDefinition',  name: 'PUBLISH_VERSION', defaultValue: ''],
        [$class: 'BooleanParameterDefinition', name: 'PUBLISH', defaultValue: Boolean.valueOf(false)],
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

    //Env vars
    env.TAG_RELEASE = params.PUBLISH_VERSION

    try {
        stage('Clone: OpenDataStandards') {
            sshagent (credentials: [git_creds]) {
                dir(ods_dir) {
                    sh "git clone -b ${ods_branch} ${ods_git} ."
                }
            }
        }

        stage('Run: ODE Build') {
              dir(ods_dir) {
                  sh 'docker build -f docker/Dockerfile.oasis_docbuilder -t oed_doc_builder .'
                  sh 'docker run -v $(pwd):/tmp/output oed_doc_builder:latest'
              }
        }

        if(params.PUBLISH){
            stage('Publish: OpenDataStandards') {
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
                        json_request['prerelease'] = false 
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

        // Store build output
        dir(ods_dir) {
            archiveArtifacts artifacts: '*.tar.gz'
            archiveArtifacts artifacts: '*.pdf'
        }

        // Run merge back if publish
        if (params.PUBLISH && params.AUTO_MERGE){
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
