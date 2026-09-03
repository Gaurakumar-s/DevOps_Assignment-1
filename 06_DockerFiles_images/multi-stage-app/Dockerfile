# Stage 1: Build
FROM node:18-alpine AS builder
WORKDIR /app
COPY app.js .

# Stage 2: Production
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/app.js .
EXPOSE 8080
CMD ["node", "app.js"]
