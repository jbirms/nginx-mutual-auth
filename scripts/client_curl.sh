#!/usr/bin/env bash

function main {
    if [ -z "${1}" ]; then
        echo "please provide a client name" >&2
        exit 1
    fi
    local dir_name="certs/${1}"
    curl -k \
        --key "${dir_name}/key.pem" \
        --cert "${dir_name}/cert.pem" \
        localhost:8000
}

main "${@}"
