.PHONY=ca-cert nginx-cert

# this generates a certificate authority cert that you can
# use to sign CSRs
ca-cert:
	@mkdir -p certs/root-ca
	openssl req \
		-x509 \
		-config openssl-ca.cnf \
		-newkey rsa:4096 \
		-sha256 \
		-nodes \
		-keyout certs/root-ca/key.pem \
		-out certs/root-ca/cert.pem \
		-outform PEM

# generates a cert for the server
nginx-cert:
	@mkdir -p certs/nginx
	openssl req \
		-x509 \
		-newkey rsa:4096 \
		-keyout certs/nginx/key.pem \
		-out certs/nginx/cert.pem \
		-days 365 \
		-nodes

# generates an untrusted cert for demo purposes
untrusted:
	@mkdir -p certs/untrusted
	openssl req \
		-x509 \
		-newkey rsa:4096 \
		-keyout certs/untrusted/key.pem \
		-out certs/untrusted/cert.pem \
		-days 365 \
		-nodes

up:
	docker-compose up

clean:
	rm -rf certs
