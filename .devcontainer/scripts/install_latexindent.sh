#!/bin/bash

LATEXINDENT_VERSION=$(curl 'https://api.github.com/repos/cmhughes/latexindent.pl/releases/latest' -kLfs | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
LATEXINDENT_URL="https://github.com/cmhughes/latexindent.pl/releases/download/${LATEXINDENT_VERSION}/latexindent.zip"
LATEXINDENT_ZIP_PATH=/tmp/latexindent.zip
LATEXINDENT_PATH_BASE=/usr/local
LATEXINDENT_PATH=${LATEXINDENT_PATH_BASE}/latexindent

curl -kLo $LATEXINDENT_ZIP_PATH $LATEXINDENT_URL
unzip $LATEXINDENT_ZIP_PATH -d $LATEXINDENT_PATH_BASE
rm $LATEXINDENT_ZIP_PATH

echo Y | perl ${LATEXINDENT_PATH}/latexindent-module-installer.pl
chmod 777 ${LATEXINDENT_PATH}/latexindent.pl
