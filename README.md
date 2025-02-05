# gha-plaground

A place to experiment with GitHub Actions rather than in my repos directly.

## Usage

This repo contains a simple C++ program that is compiled and run in a Docker image. The GitHub action will build this natively on linux/amd64 and linux/arm64. Then it will take the digests to create a unified image and sign it.

## Cosign verification

Download `cosign`:
```
curl -O -L "https://github.com/sigstore/cosign/releases/latest/download/cosign-linux-amd64"
chmod +x cosign-linux-amd64
```

Verify an image (ex. tag 0.0.3)
```
./cosign-linux-amd64 verify ghcr.io/zackelia/gha-playground:0.0.3 --certificate-identity https://github.com/zackelia/gha-playground/.github/workflows/docker-publish.yml@refs/tags/0.0.3 --certificate-oidc-issuer https://token.actions.githubusercontent.com | jq
```
