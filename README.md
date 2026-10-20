# PDF Agent

A web-based PDF reader and editor, built in Rust and compiled to WebAssembly.

Based on the open-source [PdfCraft](https://github.com/storytold/pdfcraft) project.

## Features

- Read, organize, combine, split and secure PDFs
- Runs entirely in the browser (WASM)
- No server-side processing — your PDFs never leave your device

## Deployment

Deployed on [Render](https://render.com) as a Docker web service.

### How it works

1. **Build stage**: Rust source is compiled to WASM using [Trunk](https://trunkrs.dev/)
2. **Serve stage**: Static files are served by nginx

### Deploy to Render

1. Push this repo to GitHub
2. Go to [Render Dashboard](https://dashboard.render.com/) → **New** → **Blueprint**
3. Connect your GitHub repo — Render reads `render.yaml` and sets everything up

Or manually: **New** → **Web Service** → connect repo → select **Docker** runtime.

## Local development

```bash
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Add WASM target
rustup target add wasm32-unknown-unknown

# Install Trunk
cargo install trunk --locked

# Build and serve
cd apps/pdfcraft-web
trunk serve
```

Open http://127.0.0.1:8766 in your browser.

## License

MIT OR Apache-2.0
