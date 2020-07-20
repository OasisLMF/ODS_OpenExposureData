node {
    hasFailed = false
    sh 'sudo /var/lib/jenkins/jenkins-chown'
    deleteDir() // wipe out the workspace

    properties([
      parameters([
        [$class: 'StringParameterDefinition',  name: 'ODS_BRANCH', defaultValue: BRANCH_NAME],
        [$class: 'StringParameterDefinition',  name: 'PUBLISH_VERSION', defaultValue: ''],
        [$class: 'BooleanParameterDefinition', name: 'PUBLISH', defaultValue: Boolean.valueOf(false)],
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

        //stage('Run: ODE Build') {
        //      dir(ods_dir) {
        //          // Code here
        //          
        //
        //      }
        //}

        if(params.PUBLISH){
            stage('Publish: OpenDataStandards') {
                dir(ods_dir) {
                    // Code here 
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
    }
}
