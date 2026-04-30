# Sandboxed AI
#
# Dockerfile for running Claude CLI in a containerized environment
# docker run --rm -it -v "$HOME/.config/claude-container:/claude" -v ".:/workspace" sai

FROM nixos/nix:2.30.1

RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf

RUN nix-channel --update

RUN nix profile add nixpkgs#bun
RUN NIXPKGS_ALLOW_UNFREE=1 nix profile add --impure nixpkgs#claude-code
RUN nix profile add nixpkgs#curl
RUN nix profile add nixpkgs#direnv
RUN nix profile add nixpkgs#duckdb
RUN nix profile add nixpkgs#gh
RUN nix profile add nixpkgs#git
RUN nix profile add nixpkgs#gnumake
RUN nix profile add nixpkgs#gnused
RUN nix profile add nixpkgs#nodejs_22
RUN nix profile add nixpkgs#perl
RUN nix profile add nixpkgs#prek
RUN nix profile add nixpkgs#sox
RUN nix profile add nixpkgs#sqlite

# Expose claude at a stable path so the entrypoint works regardless of
# direnv's PATH rewrites from flake-based .envrc files.
RUN mkdir -p /usr/local/bin && \
    ln -sf "$(readlink -f "$(command -v claude)")" /usr/local/bin/claude

# Set up directories
RUN mkdir -p /claude /workspace
ENV CLAUDE_CONFIG_DIR=/claude
ENV PATH="/usr/local/bin:${PATH}"
WORKDIR /workspace

# Create entrypoint script directly inside image
RUN cat <<'EOF' > /usr/local/bin/docker-entrypoint.sh
#!/usr/bin/env bash
set -e

# Load environment from .envrc if present
if [ -f /workspace/.envrc ]
then eval "$(direnv allow && direnv export bash)" || true
fi

# If no arguments passed, start Claude REPL
if [ $# -eq 0 ]
then exec /usr/local/bin/claude --dangerously-skip-permissions
else exec /usr/local/bin/claude "$@"
fi
EOF

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Security: Create and use non-root user
RUN echo "claude:x:1001:1001::/home/claude:/bin/bash" >> /etc/passwd && \
    echo "claude:x:1001:" >> /etc/group && \
    mkdir -p /home/claude && \
    chown -R 1001:1001 /home/claude /claude /workspace /nix
USER claude

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
