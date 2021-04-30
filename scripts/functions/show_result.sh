#!/bin/bash

function show_result() {
  echo
  echo   "The directories related with this installation are:"
  echo
  echo   "${VSCODE_HOME_DIR}:"
  ls -al "${VSCODE_HOME_DIR}"
  echo
  echo   "${VSCODE_SNIPPET_DIR}:"
  ls -al "${VSCODE_SNIPPET_DIR}"
  echo
  echo   "Completed."
}
