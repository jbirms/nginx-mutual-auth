#/usr/bin/env bash

function main {
    if [ -z "${1}" ]; then
        echo "please provide a client name"
        exit 1
    fi

    local client_name="${1}"
    local dir_name="certs/${client_name}"

    openssl x509 \
        -req \
        -in "${dir_name}/csr" \
        -CA certs/root-ca/cert.pem \
        -CAkey certs/root-ca/key.pem \
        -CAcreateserial \
        -out "${dir_name}/cert.pem"
}

main "${@}"
