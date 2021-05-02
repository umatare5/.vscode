#!/bin/bash

VSCODE_HOME_DIR="$HOME/Library/Application Support/Code/User"
VSCODE_SNIPPET_DIR="$VSCODE_HOME_DIR/snippets"
VSCODE_EXTENSIONS=$(find . -type f -name "extensions*.json" -maxdepth 1 -exec basename {} \;)
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

# shellcheck disable=SC2068
for extention in ${VSCODE_EXTENSIONS[@]}; do
    jq .recommendations[] < "${extention}" | xargs -I {} code --install-extension {}
done

# shellcheck disable=SC1091
source scripts/functions/show_result.sh
show_result
