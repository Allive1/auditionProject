#!/bin/bash
set -eo pipefail
python3 tests/test_handler.py

rm -rf package
cd fortune_handler
pip3 install --target ../package/python -r requirements.txt
cd ..

HOST_BUCKET='smartvue'
aws cloudformation package --template-file template.yml --s3-bucket $HOST_BUCKET --output-template-file output.yml
aws cloudformation deploy --template-file output.yml --stack-name lambda-stack --capabilities CAPABILITY_NAMED_IAM
