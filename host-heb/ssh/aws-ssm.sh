#!/bin/sh

HOST=$1
PORT=$2
USER=$3
KEY=$4

AWS_REGION="$(echo "$HOST" | cut -d '.' -f 2)"
AWS_PROFILE="$(echo "$HOST" | cut -d '.' -f 3)"
INSTANCE_ID="$(echo "$HOST" | cut -d '.' -f 4)"

export AWS_REGION
export AWS_PROFILE

aws ec2-instance-connect send-ssh-public-key \
  --instance-id="$INSTANCE_ID" \
  --instance-os-user="$USER" \
  --ssh-public-key="file://$KEY" >/dev/null

aws ssm start-session \
  --target="$INSTANCE_ID" \
  --document-name=AWS-StartSSHSession \
  --parameters="portNumber=$PORT"
