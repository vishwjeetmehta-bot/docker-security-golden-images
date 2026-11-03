# Hardened NodeJS base image
FROM node:20-alpine AS builder

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --only=production

FROM cgr.dev/chainguard/node:latest

WORKDIR /app
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY . .

EXPOSE 3000
CMD ["server.js"]
