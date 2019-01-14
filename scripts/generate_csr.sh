#/usr/bin/env bash

function main {
    if [ -z "${1}" ]; then
        echo "please provide a client name"
        exit 1
    fi

    local client_name="${1}"
    local dir_name="certs/${client_name}"

    mkdir -p "${dir_name}"

    openssl req \
		-newkey rsa:4096 \
		-sha256 \
		-nodes \
		-keyout "${dir_name}/key.pem" \
        -out "${dir_name}"/csr \
        -nodes
}

main "${@}"
