# Stage 1: Build the WASM app
FROM rust:latest AS builder

RUN rustup target add wasm32-unknown-unknown
RUN cargo install trunk --locked

WORKDIR /app
COPY . .

RUN cd apps/pdfcraft-web && trunk build --release

# Stage 2: Serve with nginx
FROM nginx:alpine

COPY --from=builder /app/dist/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 10000
