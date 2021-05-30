# .vscode

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

```bash
brew cask install visual-studio-code
```

- jq

```bash
brew install jq
```

- yarn

```bash
npm install --global yarn
```

- prettier

```bash
yarn global add prettier
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

- If you need current using files, please backup them manually before.
- To install language-specific extensions, please modify the `VSCODE_EXTENTION`.

```bash
cp settings.json    "$HOME/Library/Application Support/Code/User/"
cp keybindings.json "$HOME/Library/Application Support/Code/User/"
cp snippets/*       "$HOME/Library/Application Support/Code/User/snippets/"

export VSCODE_EXTENTION=extensions.json
jq .recommendations[] < ${VSCODE_EXTENTION} | xargs -I {} code --install-extension {}
```

## Changelog

- May 1st, 2021
  - Initialized
