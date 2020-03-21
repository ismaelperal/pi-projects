#!/bin/bash

set -e

##########################
# ENTER DEVICE INFORMATION
##########################
if [[ ! -f .secrets ]]; then
	echo "Please insert your SSH private KEY PATH:"
	read SSH_KEY_PATH
	echo "Please insert your remote user:"
	read SSH_REMOTE_USER
	echo "Please insert your remote host address:"
	read REMOTE_HOST_IP
	echo "SSH_KEY_PATH=${SSH_KEY_PATH}
SSH_REMOTE_USER=${SSH_REMOTE_USER}
REMOTE_HOST_IP=${REMOTE_HOST_IP}" > secrets/deploy.env
else
	set -o allexport
	. ./.secrets
	set +o allexport
fi

# add authorized key
ssh-copy-id -i $SSH_KEY_PATH $SSH_REMOTE_USER@$REMOTE_HOST_IP

# change ssh config
scp -r ./ssh $SSH_REMOTE_USER@$REMOTE_HOST_IP:/etc/ssh

# copy stack files
scp -r ./srv $SSH_REMOTE_USER@$REMOTE_HOST_IP:/srv

ssh $SSH_REMOTE_USER@$REMOTE_HOST_IP
