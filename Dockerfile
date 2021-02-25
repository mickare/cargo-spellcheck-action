FROM rust:latest

# Install clang to compile hunspell CXX source files
RUN apt-get update && apt-get install -y \
        clang \
        hunspell-en-us \
    && rm -rf /var/lib/apt/lists/*

# Configure LLVM and install cargo-spellcheck
RUN export LLVM_CONFIG_PATH=/usr/local/opt/llvm/bin/llvm-config \
    && cargo install cargo-spellcheck

ENTRYPOINT [ "cargo", "spellcheck" ]