#!/bin/bash
set -eo pipefail
HOST_BUCKET='smartvue'
aws cloudformation package --template-file template.yml --s3-bucket $HOST_BUCKET --output-template-file output.yml
aws cloudformation deploy --template-file output.yml --stack-name ec2-stack --capabilities CAPABILITY_NAMED_IAM
