#!/bin/sh

set -o pipefail

RELEASE_URL=https://api.github.com/repos/pinterest/ktlint/releases/latest

KTLINT_URL=$(wget -q --output-document - ${RELEASE_URL} | \
  grep -E -o "https:.+?releases/download.*/ktlint" | \
  head -n 1)

# Install ktlint
wget -q ${KTLINT_URL} && \
  chmod a+x ktlint && \
  mv ktlint /usr/local/bin/

echo "---------------> KtLint version: $(ktlint --version)"
ktlint --relative
