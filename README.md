<div align="center">

# 🐳 Hardened Docker Golden Images & SBOM Pipeline

[![Docker](https://img.shields.io/badge/Docker-Hardened_Images-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Distroless](https://img.shields.io/badge/Base-Google_Distroless-4285F4?style=for-the-badge&logo=google&logoColor=white)](https://github.com/GoogleContainerTools/distroless)
[![Cosign](https://img.shields.io/badge/Signature-Sigstore_Cosign-blueviolet?style=for-the-badge&logo=linuxfoundation&logoColor=white)](https://www.sigstore.dev/)
[![SBOM: Syft](https://img.shields.io/badge/SBOM-SPDX_Syft-0078D4?style=for-the-badge&logo=anchore&logoColor=white)](https://github.com/anchore/syft)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](./LICENSE)

<p align="center">
  <b>Enterprise container supply chain security framework delivering minimal Distroless/Chainguard golden base images, zero shell vulnerabilities, non-root execution, cryptographic Cosign signatures, and automated SPDX SBOMs.</b>
</p>

</div>

---

## 🔒 Supply Chain Security Lifecycle

```
Multi-Stage Build (Distroless/Chainguard)
                   │
                   ▼
       Syft SPDX SBOM Generation
                   │
                   ▼
         Grype Vulnerability Gate (Fail on Critical/High)
                   │
                   ▼
      Cosign Cryptographic Signature & Attestation
                   │
                   ▼
  OCI Registry Push (Signed & Verified)
```

---

## 📁 Repository Layout

```
docker-security-golden-images/
├── .github/workflows/
│   └── build-sign-scan.yml   # Multi-arch automated build and Cosign signing
├── images/
│   ├── python/Dockerfile     # Distroless Python 3.11 with non-root UID 65532
│   └── nodejs/Dockerfile     # Chainguard Node.js 20 production runtime
├── scripts/
│   └── generate-sbom.sh      # Syft SBOM export + Grype scanner + Cosign sign
└── README.md
```

---

## 👤 Author

**Vishwjeet Kumar Mehta**  
Senior DevOps & DevSecOps Consultant | Cloud & Infrastructure Architect  
- **LinkedIn**: [linkedin.com/in/vishwjeetmehta](https://linkedin.com/in/vishwjeetmehta)  
- **GitHub**: [@vishwjeetmehta-bot](https://github.com/vishwjeetmehta-bot)
