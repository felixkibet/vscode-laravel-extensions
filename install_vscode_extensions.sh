#!/bin/bash

# Read extensions from extensions.json
EXTENSIONS=($(jq -r '.[]' extensions.json))

echo '🚀 Checking and installing VSCode extensions...'

# Check and install extensions
for ext in "${EXTENSIONS[@]}"; do
    if code --list-extensions | grep -q "$ext"; then
        echo "✅ $ext already installed."
    else
        echo "⬇️ Installing $ext..."
        code --install-extension "$ext"
    fi
done

echo '🎉 Installation successful!'
