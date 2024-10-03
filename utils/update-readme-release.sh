#!/bin/bash

BASE_URL="https://github.com/OasisLMF/ODS_OpenExposureData/releases"
REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

README_PATH=$REPO_DIR/README.md
README_MATCH='<!-- NEW VERSION TAG -->'

function usage {
  echo
  echo "Usage: $0 <release-tag>"
  echo
  echo "This script appends release assest links to the repos README.md file"
  echo " where '<release-tag>' is the github tag linked to a released version of OED"
  echo
  echo ""
  exit 0
}

function check_input {
    input_var=$1

    VALID=$(echo $input_var | grep -oPc "^(\d+)\.(\d+)\.(\d+)$")
    if [[ ! "$VALID" == 1 ]]; then
        echo "Release Tag is not given or invalid Semvar, input_var=$input_var"
        usage
    fi
}

check_input $1

TAG=$1
RELEASE_LINK_EXCEL="| $TAG | [OpenExposureData_Spec.xlsx]($BASE_URL/download/$TAG/OpenExposureData_Spec.xlsx )"
RELEASE_LINK_JSON=" | [OpenExposureData_Spec.json]($BASE_URL/download/$TAG/OpenExposureData_Spec.json )"
RELEASE_LINK_NOTE=" | [Release Page]($BASE_URL/tag/$TAG) |"

sed -i "/$README_MATCH/i\ $RELEASE_LINK_EXCEL$RELEASE_LINK_JSON$RELEASE_LINK_NOTE" $README_PATH
