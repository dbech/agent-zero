# Agent Zero — dependency layer
# Extends the official Agent Zero image with pre-installed system packages.
# Pass EXTRA_PACKAGES at build time to customise what gets installed.
FROM agent0ai/agent-zero:latest

# Packages to install — override at build time:
#   docker build --build-arg EXTRA_PACKAGES="pkg1 pkg2 pkg3" -t myimage .
#
# Defaults cover the known CamoFox / camoufox Firefox binary dependencies.
ARG EXTRA_PACKAGES="\
    xvfb \
    x11vnc \
    websockify \
    libgtk-3-0 \
    libdbus-glib-1-2 \
    libx11-xcb1 \
    libxt6 \
    libasound2t64 \
    libpulse0 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxcursor1 \
    libxi6 \
    libxss1 \
    libnss3 \
    libnspr4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libgbm1 \
    libpango-1.0-0 \
    libcairo2 \
    libxrender1 \
    libxtst6 \
    libxkbcommon0 \
    libxshmfence1 \
    libpangocairo-1.0-0 \
    fonts-freefont-ttf \
    fonts-liberation \
    fonts-noto \
    fonts-noto-color-emoji \
    fontconfig \
    python3-websockify \
    ca-certificates \
    curl \
    git"

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends $EXTRA_PACKAGES \
    && rm -rf /var/lib/apt/lists/*
