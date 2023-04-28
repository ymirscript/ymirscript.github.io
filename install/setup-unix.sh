#!/bin/bash

ymir_folder="$HOME/.local/ymir"
mkdir -p "$ymir_folder"

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

path_file=""
case "$SHELL" in
    *"/bash")
        path_file="$HOME/.bashrc"
        ;;
    *"/zsh")
        path_file="$HOME/.zshrc"
        ;;
    *)
        echo "Unknown shell, please add the path manually to the PATH variable: $ymir_folder"
        exit 1
        ;;
esac

if ! grep -q "$ymir_folder" "$path_file"; then
    echo "export PATH=\$PATH:$ymir_folder" >> "$path_file"
fi