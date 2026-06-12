vim.opt.mouse = "a" -- Enable mouse support in all modes
vim.opt.timeoutlen = 500 -- Délai pour les mappings normaux
vim.opt.ttimeoutlen = 10 -- Délai pour les codes de touches

vim.opt.relativenumber = true

---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "tokyonight",
  transparency = true,
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
    abbr_maxwidth = 60,
    -- for tailwind, css lsp etc
    format_colors = { lsp = true, icon = "󱓻" },
  },
  ---@class Base46Config
  hl_override = {
    NvDashAscii = {
      bg = "NONE",
      fg = "blue",
    },
    NvDashButtons = { bg = "NONE" },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

-- Improve terminal color contrast (helps LazyGit readability).
vim.g.terminal_color_4 = "#89b4fa"
vim.g.terminal_color_12 = "#89b4fa"

-- Improved nvim-tree mouse handling
local function nvim_tree_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Apply default mappings first
  api.config.mappings.default_on_attach(bufnr)

  -- Function to handle double-click behavior
  local function handle_double_click()
    local node = api.tree.get_node_under_cursor()
    if not node then
      return
    end

    if node.nodes then
      -- It's a directory, toggle it
      api.node.open.edit()
    else
      -- It's a file, open it
      api.node.open.edit()
      -- Ne ferme plus le tree automatiquement
    end
  end

  -- Map both double-click and Enter to the same behavior
  vim.keymap.set("n", "<2-LeftMouse>", handle_double_click, opts "Open/Toggle Double-Click")
  vim.keymap.set("n", "<CR>", handle_double_click, opts "Open/Toggle Enter")
end

-- Set the on_attach function for nvim-tree
M.on_attach_nvim_tree = nvim_tree_on_attach

-- Make current line in nvim-tree clearly visible.
local function set_nvimtree_highlights()
  vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#313244", bold = true })
  vim.api.nvim_set_hl(0, "NvimTreeCursorLineNr", { fg = "#89b4fa", bg = "#313244", bold = true })
end

local function set_comment_highlights()
  vim.api.nvim_set_hl(0, "Comment", { fg = "#a6adc8", italic = true })
  vim.api.nvim_set_hl(0, "@comment", { fg = "#a6adc8", italic = true })
end

local nvimtree_hl_group = vim.api.nvim_create_augroup("CustomNvimTreeHighlights", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = nvimtree_hl_group,
  callback = function()
    set_nvimtree_highlights()
    set_comment_highlights()
  end,
})
set_nvimtree_highlights()
set_comment_highlights()

return M
