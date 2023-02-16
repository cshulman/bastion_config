#!/bin/bash

export CLUSTERNAME=<cluster-name>
export AWSKEY=<key>
export AWSSECRETKEY=<secretkey>
export REGION=<region>


#remove dir if it exists
rm -rf $HOME/.aws

mkdir $HOME/.aws

cat << EOF >>  $HOME/.aws/credentials
[default]
aws_access_key_id = ${AWSKEY}
aws_secret_access_key = ${AWSSECRETKEY}
region = $REGION
EOF

echo "Testing aws credentials"
aws sts get-caller-identity
cat $HOME/.aws/credentials

echo "Generating ssh"
ssh-keygen -t ed25519 -C 'email' -f ~/.ssh/${CLUSTERNAME}-key -N ''

echo "Done with all of the things"
