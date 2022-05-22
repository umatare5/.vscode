# my-vscode-settings

My Visual Studio Code for Mac settings.

## Overview

### settings.json

- Contains settings for all extensions.

### extensions.json

- Declares common-use extensions.

### extensions.[langName].json

- Declares language-specific extensions.

### keybindings.json

- Used for `formulahendry.code-runner`.

## Installation

### Requirements

- vscode

  [Visual Studio Code - Download Visual Studio Code](https://code.visualstudio.com/download)

- jq

  ```bash
  brew install jq
  ```

- prettier

  ```bash
  npm install --global prettier
  ```

### Minimum

- Install `settings.json`, `keybindings.json` and `extensions.json`.

```bash
scripts/install.sh
```

### Complete

- In additional to the minimal, add all `extensions.[langName].json` as well.

```bash
scripts/install_with_all_extensions.sh
```

### Manual

- If you need to keep current files, please backup them manually before.
- To install language-specific extensions, please modify `VSCODE_EXTENTION`.

```bash
cp settings.json    "$HOME/Library/Application Support/Code/User/"
cp keybindings.json "$HOME/Library/Application Support/Code/User/"
cp snippets/*       "$HOME/Library/Application Support/Code/User/snippets/"

export VSCODE_EXTENTION=extensions.json
jq .recommendations[] < ${VSCODE_EXTENTION} | xargs -I {} code --install-extension {}
```

## Changelog

| Timestamp      | Details    |
| -------------- | ---------- |
| May 1st, 2021  | Initialize |
| May 22th, 2022 | Up to date |
