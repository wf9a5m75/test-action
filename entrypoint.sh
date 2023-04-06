#!/bin/bash

set -o pipefail

echo "KtLint version: $(ktlint --version)"

ktlint --relative
