#!/bin/bash
# # This file should be sourced
# mkdir /home/action-runner
# sudo chown action-runner /home/action-runner --recursive
# sudo chgrp action-runner /home/action-runner --recursive
# sudo useradd -d /home/action-runner action-runner

# # Change directory to user home
# cd /home/action-runner

# Install Github runner agent
mkdir actions-runner && cd actions-runner
# Download the latest runner package
curl -o actions-runner-linux-x64-2.306.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.306.0/actions-runner-linux-x64-2.306.0.tar.gz
# Optional: Validate the hash
echo "b0a090336f0d0a439dac7505475a1fb822f61bbb36420c7b3b3fe6b1bdc4dbaa  actions-runner-linux-x64-2.306.0.tar.gz" | shasum -a 256 -c
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.306.0.tar.gz

# Create the runner and start the configuration experience
./config.sh --url https://github.com/tecgovtnz --token ADUF4B6MN6WTJPZYXCMIIR3EW42ZM --runasservice --name $(hostname) --work _work --runnergroup Default --label Linux
#install as a service account
./svc.sh install action-runner
# Last step, run it!
./svc.sh start
./svc.sh status

cd ~
