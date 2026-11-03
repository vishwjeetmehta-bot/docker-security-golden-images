#!/usr/bin/env bash
# ==============================================================================
# SBOM Generation & Cosign Signing Utility
# Author: Vishwjeet Kumar Mehta
# ==============================================================================
set -eo pipefail

IMAGE_TAG="${1:-my-image:latest}"

echo "==> Generating Software Bill of Materials (SBOM) using Syft..."
syft "$IMAGE_TAG" -o spdx-json=sbom.spdx.json

echo "==> Scanning SBOM for vulnerabilities using Grype..."
grype sbom:sbom.spdx.json --fail-on high

echo "==> Signing container image using Cosign..."
cosign sign --yes "$IMAGE_TAG"

echo "==> Attaching SBOM attestation..."
cosign attest --yes --predicate sbom.spdx.json --type spdx "$IMAGE_TAG"
echo "✅ Image signed and attested successfully!"
