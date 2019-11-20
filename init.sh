#!/bin/bash

AEGEA_VERSION=$(grep AEGEA_VERSION .env | xargs)
IFS='=' read -ra AEGEA_VERSION <<< "$AEGEA_VERSION"
AEGEA_VERSION=${AEGEA_VERSION[1]}

# Install Aegea if not
shopt -s dotglob     # To include hidden files
files=(aegea/*)
if [ ${#files[@]} -lt 2 ]; then 
    DIST="e2_distr_v$AEGEA_VERSION.zip"
    URL="https://blogengine.ru/download/$DIST"
    curl -O $URL && unzip $DIST -d aegea
    rm $DIST
fi

# Unset the variable  for bash behavior
shopt -u dotglob

sudo chmod -R 777 aegea
