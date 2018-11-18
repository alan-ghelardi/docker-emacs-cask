#!/usr/bin/env bash
set -euo pipefail

cask init

cask exec emacs -Q --batch \
     --eval "(message \"I'm alive!\")"
