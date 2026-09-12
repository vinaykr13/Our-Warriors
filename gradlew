#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
GRADLE_VERSION="8.9"
CACHE_DIR="${GRADLE_USER_HOME:-$HOME/.gradle}/wrapper/dists/warrioraspirants-gradle-${GRADLE_VERSION}"
GRADLE_HOME="$CACHE_DIR/gradle-${GRADLE_VERSION}"
if [ ! -x "$GRADLE_HOME/bin/gradle" ]; then
  mkdir -p "$CACHE_DIR"
  ZIP="$CACHE_DIR/gradle.zip"
  echo "Downloading Gradle ${GRADLE_VERSION}..."
  curl -fsSL "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -o "$ZIP"
  rm -rf "$CACHE_DIR/gradle-${GRADLE_VERSION}"
  unzip -q "$ZIP" -d "$CACHE_DIR"
  rm -f "$ZIP"
fi
exec "$GRADLE_HOME/bin/gradle" "$@"
