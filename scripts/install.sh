#!/bin/bash

VSCODE_HOME_DIR="$HOME/Library/Application Support/Code/User"
VSCODE_SNIPPET_DIR="$VSCODE_HOME_DIR/snippets"
VSCODE_EXTENSIONS="extensions.json"
VSCODE_SETTING="settings.json"
VSCODE_KEYBIND="keybindings.json"

# shellcheck disable=SC1091
source scripts/functions/do_validation.sh
do_validation

# shellcheck disable=SC1091
source scripts/functions/backup_and_rotate.sh
backup_and_rotate

cp ${VSCODE_SETTING} "${VSCODE_HOME_DIR}"
cp ${VSCODE_KEYBIND} "${VSCODE_HOME_DIR}"
cp snippets/*        "${VSCODE_SNIPPET_DIR}"

jq .recommendations[] < "${VSCODE_EXTENSIONS}" | xargs -I {} code --install-extension {}

# shellcheck disable=SC1091
source scripts/functions/show_result.sh
show_result
