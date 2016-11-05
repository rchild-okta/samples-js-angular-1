#!/bin/bash -vx

cd ${OKTA_HOME}/${REPO}

export TEST_SUITE_TYPE="checkstyle"
export TEST_RESULT_FILE_DIR="${REPO}/build2/reports/lint"

if ! npm install; then
  echo "npm install failed! Exiting..."
  exit ${FAILED_SETUP}
fi

if ! npm run lint:report; then
  echo "lint failed! Exiting..."
  exit ${TEST_FAILURE}
fi

echo $TEST_SUITE_TYPE > $TEST_SUITE_TYPE_FILE
echo $TEST_RESULT_FILE_DIR > $TEST_RESULT_FILE_DIR_FILE
exit $PUBLISH_TYPE_AND_RESULT_DIR;