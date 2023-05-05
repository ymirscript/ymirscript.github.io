#!/bin/bash

ymir_folder="/usr/local/bin"

case "$(uname -s)" in
    Linux*)
        ymir_exe_url="https://github.com/ymirscript/ymir/releases/latest/download/ymir-linux"
        ;;
    Darwin*)
        ymir_exe_url="https://github.com/ymirscript/ymir/releases/latest/download/ymir-macos"
        ;;
    *)
        echo "Unknown operating system. Please download the ymir executable manually."
        exit 1
        ;;
esac

ymir_exe_path="$ymir_folder/ymir"
curl -L "$ymir_exe_url" -o "$ymir_exe_path"
chmod +x "$ymir_exe_path"

if [[ ":$PATH:" != *":$ymir_folder:"* ]]; then
    echo "export PATH=$ymir_folder:\$PATH" >> ~/.bashrc
    source ~/.bashrc
fi

echo "Ymir installed successfully!"