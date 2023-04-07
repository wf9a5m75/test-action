#!/bin/bash

set -o pipefail

echo "---------------> here!!!!"
echo "KtLint version: $(ktlint --version)"

ktlint --relative
