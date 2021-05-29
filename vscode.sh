#!/bin/bash

XAUTH_TOKEN=$1

touch ~/.Xauthority
xauth add "${DISPLAY}" . "${XAUTH_TOKEN}"
xauth list

# uncomment the following line to debug startup
# export ELECTRON_ENABLE_LOGGING=true
/VSCode-linux-x64/code
