#!/bin/bash

source scripts/common.sh

function install_dependencies() {
    # install dependencies
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        echo "Updating brew"
        brew update
        echo "Installing wget and unzip"
        brew install wget
        brew install unzip
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        if command -v apt-get &>/dev/null; then
            echo "Updating apt"
            sudo apt-get update
            echo "Installing wget and unzip"
            sudo apt-get install wget
            sudo apt-get install unzip
        else
            echo "This script only supports apt-get package manager"
            echo "Please install wget and unzip manually"
        fi
    fi
}

function usage() {
    echo "Usage: $0 [-h] [-d]"
    echo "  -h: Print this help message"
    echo "  -d: Install dependencies"
    exit 1
}

while getopts "hd" opt; do
    case ${opt} in
        h)
            usage
            ;;
        d)
            install_dependencies
            ;;
        *)
            usage
            ;;
    esac
done

# check if dependencies are installed
for command in wget unzip python3; do
    if ! command -v $command &>/dev/null; then
        echo "$command not installed"
        echo "Please run $0 -d to install dependencies or install $command manually"
        exit 1
    fi
done


echo "Setting up host"
print_env

# Get mendel sd card image
mkdir -p ${SETUP_DIR}
wget -P ${SETUP_DIR} https://dl.google.com/coral/mendel/enterprise/enterprise-eagle-flashcard-20211117215217.zip

# Unzip sd card image
unzip ${SETUP_DIR}/enterprise-eagle-flashcard-20211117215217.zip -d ${SETUP_DIR}

echo "Mendel image retrieved and unzipped"
echo "Please open balenaEtcher and flash the image to a SD card"
echo "https://www.balena.io/etcher/"
