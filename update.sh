#!/bin/bash
set -xeuo pipefail #abort on fail
####
# Usage: ./update.sh $docker_tag $namespace
# ./update.sh  develop-65 qa
# Deploys docker image with the specified tag to the specified namespace in k8s
####

args=("$@")

# delete tempdir if it exists
if [[ -d ./tempdir ]]; then
  rm -rf ./tempdir
fi

# create tempdir and clone the script
mkdir ./tempdir && cd tempdir
git clone git@github.com:ScriptRock/deploy_secure.git
cd deploy_secure

# run the script and clean up
./deploy.sh "${args[0]}" "${args[1]}"
rm -rf ../../tempdir
