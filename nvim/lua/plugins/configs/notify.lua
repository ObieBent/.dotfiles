local options = {
  timeout = 3000,
  max_width = 80,
  background_colour = "#000000",
  max_height = function()
    return math.floor(vim.o.lines * 0.75)
  end,
}

return options
