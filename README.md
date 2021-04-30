# .vscode

My Visual Studio Code for Mac settings.

## Overview

### settings.json

- Contains settings for all extentions.

### extentions.json

- Declares common-use extensions.

### extentions.[langName].json

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

- If you need current files, please backup them manually.
- For install language-specific extensions, please modify last command.

```bash
cp settings.json    "$HOME/Library/Application Support/Code/User/"
cp keybindings.json "$HOME/Library/Application Support/Code/User/"
cp snippets/*       "$HOME/Library/Application Support/Code/User/snippets/"
jq .recommendations[] < extensions.json | xargs -I {} code --install-extension {}
```

## Changelog

- May 1st, 2021
  - Initialized
