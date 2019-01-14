#!/usr/bin/env python
from flask import Flask, jsonify, request
import re

APP = Flask(__name__)

CN_RE = re.compile(r"CN=([^,]+),")

@APP.route("/")
def serve():
    # Shouldn't be possible with fronting server
    if "X-Cert-Info" not in request.headers:
        return (
            jsonify(dict(request.headers, result="UNAUTHORIZED")),
            403,
        )

    match = CN_RE.search(request.headers["X-Cert-Info"])
    if match:
        name = match.group(1)
        return (
            jsonify(dict(request.headers, message=f"Hi {name}")),
            200,
        )
    else:
        return (
            jsonify(dict(request.headers, message="Why no common name?")),
            200,
        )
