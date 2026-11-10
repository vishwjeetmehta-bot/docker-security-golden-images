# Multi-stage build for hardened Python runtime
# Stage 1: Build stage with compiler toolchain
FROM python:3.11-slim-bullseye AS builder

WORKDIR /build
RUN apt-get update && apt-get install -y --no-install-recommends gcc libpq-dev && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# Stage 2: Minimal Distroless runtime
FROM gcr.io/distroless/python3-debian12:nonroot

WORKDIR /app
COPY --from=builder /install /usr/local
COPY src/ /app/

# Enforce non-root security context (UID 65532 is distroless default)
USER nonroot:nonroot

EXPOSE 8080
ENTRYPOINT ["python", "main.py"]

