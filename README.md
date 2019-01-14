
# NGINX Mutual Authentication

Demonstration of mutual authentication (client cert auth) with a custom CA enforced by Nginx

## requirements
- docker
- docker-compose
- openssl

## demo:
1) generate CA certs and keys in `certs/root-ca/`: `make ca-cert`
2) generate nginx certs (self signed for example purposes) `certs/nginx/`: `make nginx-cert`
3) stand up the nginx w/ certs on port 8000 with a backing python flask server: `make up`
4) prove the server rejects cert-less requests: `curl localhost:8000`
5) generate some "untrusted" certs in `certs/untrusted/` with `make untrusted`
6) prove the server rejects those with `scripts/client_curl.sh untrusted`
7) Pretend to be a client and run `scripts/generate_csr.sh NAME` to put a private key and CSR in `certs/NAME/`
8) If you trust them, run `scripts/sign_csr.sh NAME` to create a signed cert in `certs/NAME/`
9) Verify that the signed cert is accepted and the certified information is echoed back by the Python with `scripts/client_curl.sh NAME`
