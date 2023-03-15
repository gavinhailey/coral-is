#!/bin/bash

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CORAL_DIR="$(cd "${SCRIPTS_DIR}/.." && pwd)"
SETUP_DIR="${CORAL_DIR}/setup"

function print_env {
    echo "Environment: ${OSTYPE}"
    echo "Repo Dir:    ${CORAL_DIR}"
    echo "Setup Dir:   ${SETUP_DIR}"
    echo "Scripts Dir: ${SCRIPTS_DIR}"
}
