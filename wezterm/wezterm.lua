-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- Font Settings
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 16
config.line_height = 1.4

-- Color Schema
config.color_scheme = "tokyonight"

-- Appearance
config.cursor_blink_rate = 0
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_background_image = wezterm.home_dir .. "/.config/wezterm/assets/bg-blurred-darker.png"

config.window_background_image_hsb = {
	brightness = 0.5,
	saturation = 1.0,
	hue = 1.0,
}

config.window_background_opacity = 1.0
config.macos_window_background_blur = 40

-- Extra key binding for splitting and rotating the screen
config.keys = {
	{
		key = "o",
		mods = "CTRL|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "e",
		mods = "CTRL|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Use other key bindings for resizing as SHIFT|CTRL|ALT+UP/DOWN is take by Ubuntu
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Down", 1 }) },
	-- This means, also re-assigning the binding to focus panes.
	{ key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down") },
}

-- Scrollback
config.scrollback_lines = 10000

-- Left and right option key
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

return config
