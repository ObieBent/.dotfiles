# Custom Neovim Configuration (NvChad-based)

A custom Neovim setup built on top of [NvChad](https://nvchad.com/), focused on a full Go/Python developer workflow with YAML/Ansible support.

## What Is Custom In This Config

- Full LSP stack with explicit enablement (`vim.lsp.enable`) for:
  - Go (`gopls`)
  - Python (`pyright`, `ruff`)
  - YAML (`yamlls`)
  - Ansible (`ansiblels`)
- Mason toolchain bootstrap for development tools (LSP, formatters, linters, debuggers)
- DAP debugging stack:
  - `nvim-dap`
  - `nvim-dap-ui`
  - `nvim-dap-go`
  - `nvim-dap-python`
- Test workflow with `neotest`:
  - `neotest-go`
  - `neotest-python`
- Formatting via `conform.nvim`
- Linting via `nvim-lint`
- Go helpers via `gopher.nvim`
- YAML/Ansible editing support via `ansible-vim`
- LazyGit integration (`<leader>gg` / `<leader>gl`)
- Project-wide find/replace via `grug-far`:
  - open global replace: `<leader>rr`
  - open with current word prefilled: `<leader>rw`
  - in `grug-far` buffer, `<localleader>` is set to `,` (`,r` replace, `,s` sync all)
- Improved UI readability tweaks:
  - stronger `nvim-tree` cursor highlight
  - improved comment highlight contrast
  - terminal color tuning for LazyGit readability

## Version

- SemVer: `0.2.0`

## Prerequisites

- Neovim `>= 0.11`
- Git
- Nerd Font enabled in your terminal
- `ripgrep` and `fd` (for Telescope)
- `lazygit` (optional but recommended)
- Language runtimes:
  - Go (recommended `>= 1.21`)
  - Python (`>= 3.10`)

## Installation

```bash
# backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# clone this repo
git clone https://github.com/MacFlurry/nvim.git ~/.config/nvim

# start neovim
nvim
```

After first launch, install all Mason tools:

```vim
:MasonInstallAll
```

## Basic Usage

- Open file tree: `<leader>e`
- Reveal/focus current file in tree: `:NvimTreeFindFile`
- Go to definition: `gd`
- Hover documentation: `K`
- LSP rename symbol: `<leader>ra`
- Global replace panel: `<leader>rr`
- Global replace panel with word under cursor: `<leader>rw`
- Git blame (line): `<leader>gb`
- Open LazyGit: `<leader>gg`

## Test / Validation

This repo includes basic non-regression checks:

```bash
tests/run.sh
```

## Structure

```text
~/.config/nvim/
├── init.lua
├── lua/
│   ├── custom/
│   │   ├── chadrc.lua
│   │   ├── plugins.lua
│   │   ├── mappings.lua
│   │   ├── stack.lua
│   │   └── configs/
│   │       ├── lspconfig.lua
│   │       ├── conform.lua
│   │       ├── lint.lua
│   │       ├── dap.lua
│   │       └── neotest.lua
│   └── ...
└── tests/
```
