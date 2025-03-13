#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Ensure SHELL is set
if [[ -z "${SHELL:-}" ]]; then
    export SHELL="/bin/bash"
fi

# Ensure XDG_CONFIG_HOME is set
if [[ -z "${XDG_CONFIG_HOME:-}" ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

# Set DEV_ENV variable
export DEV_ENV="$HOME/dev"
echo "DEV_ENV set to $DEV_ENV"

# Install necessary dependencies
echo "Checking and installing dependencies..."
if [[ "$(uname)" == "Darwin" ]]; then
    # macOS dependencies
    command -v brew >/dev/null || {
        echo "Homebrew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    }
    brew install curl git bash
else
    # Linux dependencies
    sudo apt update && sudo apt install -y curl git bash
fi

# Fetch and execute setup script
echo "Downloading and executing setup script..."
cd ~
curl -fsSL https://raw.githubusercontent.com/thenameiswiiwin/.dotfiles/main/resources/setup | bash

echo "Setup completed successfully!"
