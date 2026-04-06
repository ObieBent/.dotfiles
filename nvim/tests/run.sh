#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
nvim --headless '+lua dofile(vim.fn.stdpath("config") .. "/tests/stack_spec.lua")' '+qa'
nvim --headless '+lua dofile(vim.fn.stdpath("config") .. "/tests/lsp_attach_spec.lua")' '+qa'
