#!/bin/bash

CURRENT_DIR=$(basename "$(pwd)")
VSCODE_PATH=$(which code)

function do_validation() {
  if [ "$CURRENT_DIR" != ".vscode" ]; then
    echo -e "Invalid directory. Please move to '.vscode'."
    exit
  fi

  if [ "${VSCODE_PATH}" == "" ]; then
    echo -e "Missing 'code'. Please install vscode to set PATH to 'code'."
    exit
  fi
}
