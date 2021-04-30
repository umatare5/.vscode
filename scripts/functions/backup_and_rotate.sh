#!/bin/bash

VSCODE_BACUP_SUFFIX="backup"

function backup_and_rotate() {
if [ -e "${VSCODE_HOME_DIR}/${VSCODE_SETTING}" ]; then
  echo "Backup ${VSCODE_SETTING} to ${VSCODE_BACUP_SUFFIX}."
  cp "${VSCODE_HOME_DIR}/${VSCODE_SETTING}" "${VSCODE_HOME_DIR}/${VSCODE_SETTING}.${VSCODE_BACUP_SUFFIX}"
fi

if [ -e "${VSCODE_HOME_DIR}/${VSCODE_KEYBIND}" ]; then
  echo "Backup ${VSCODE_KEYBIND} to ${VSCODE_KEYBIND}.${VSCODE_BACUP_SUFFIX}."
  cp "${VSCODE_HOME_DIR}/${VSCODE_KEYBIND}" "${VSCODE_HOME_DIR}/${VSCODE_KEYBIND}.${VSCODE_BACUP_SUFFIX}"
fi

if [ -d "${VSCODE_SNIPPET_DIR}" ]; then
  VSCODE_SNIPPETS=$(find "${VSCODE_SNIPPET_DIR}" -type f -name "*.json" -exec basename {} \;)
  # shellcheck disable=SC2068
  for snippet in ${VSCODE_SNIPPETS[@]}; do
    echo "Backup ${snippet} to ${snippet}.${VSCODE_BACUP_SUFFIX}."
    cp "${VSCODE_SNIPPET_DIR}/${snippet}" "${VSCODE_SNIPPET_DIR}/${snippet}.${VSCODE_BACUP_SUFFIX}"
  done
fi
}
