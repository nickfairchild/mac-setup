#!/usr/bin/env bash

source apps/npms.sh

echo "Installing npms ..."
install 'npm install --global' ${npms[@]}

echo "npms installed!"