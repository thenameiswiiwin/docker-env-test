#!/usr/bin/env bash
set -euo pipefail

echo "Downloading and running setup script..."
curl -fsSL https://raw.githubusercontent.com/thenameiswiiwin/.dotfiles/main/resources/setup -o ~/setup.sh
chmod +x ~/setup.sh
bash ~/setup.sh
echo "Setup script completed!"
exec /bin/bash
