-- Get default options from NvChad
local nvchad_nvimtree = require("plugins.configs.nvimtree")

-- Add our custom on_attach function
nvchad_nvimtree.on_attach = require("custom.chadrc").on_attach_nvim_tree

-- Return the modified config
return nvchad_nvimtree 