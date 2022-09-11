-- https://github.com/wez/wezterm/discussions/529 opening file

local wezterm = require("wezterm")

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Dracula (Official)"
	else
		return "Catppuccin Latte"
	end
end

local mantle = "#e6e9ef"
local text = "#4c4f69"
local surface = "#acb0be"

local scheme = wezterm.get_builtin_color_schemes()["Catppuccin Latte"]
scheme.tab_bar.active_tab.bg_color = mantle
scheme.tab_bar.active_tab.fg_color = text
scheme.tab_bar.inactive_tab.bg_color = surface
scheme.tab_bar.inactive_tab.fg_color = text
scheme.tab_bar.inactive_tab_hover.bg_color = mantle
scheme.tab_bar.inactive_tab_hover.fg_color = text
scheme.tab_bar.new_tab_hover.bg_color = mantle
scheme.tab_bar.new_tab_hover.fg_color = text
scheme.tab_bar.new_tab_hover.italic = true

return {
	-- TODO: run in to fix the issue
	-- $ fish
	-- $ fish_add_path /opt/homebrew/bin
	default_prog = { "/opt/homebrew/bin/fish", "-l" },
	check_for_updates = false,

	font = wezterm.font_with_fallback({
		{ family = "JetBrains Mono" },
		{ family = "FiraCode Nerd Font Mono" },
	}),
	font_size = 15,

	line_height = 1.1,
	harfbuzz_features = { "zero", "ss01", "cv05" },

	allow_square_glyphs_to_overflow_width = "Always",
	font_antialias = "Subpixel",
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	window_decorations = "RESIZE",
	-- tab_max_width = 26,

	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	color_schemes = {
		["Catppuccin Latte"] = scheme,
	},

	window_padding = {
		left = "1cell",
		right = "1cell",
		top = "0cell",
		bottom = "0cell",
	},
	foreground_text_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},
	font_dirs = { "fonts" },
	window_frame = {
		font = wezterm.font({ family = "JetBrains Mono", weight = "Bold" }),
		font_size = 14,
	},

	scrollback_lines = 3500,
	native_macos_fullscreen_mode = true,
	pane_focus_follows_mouse = false,

	keys = {
		{
			key = ";",
			mods = "SUPER",
			action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "/", mods = "SUPER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{ key = "x", mods = "SUPER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

		-- Pane Sections
		-- Pane Navigates
		{ key = "h", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "l", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "k", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "j", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		-- Pane Resize
		{ key = "H", mods = "SUPER", action = wezterm.action({ AdjustPaneSize = { "Left", 2 } }) },
		{ key = "J", mods = "SUPER", action = wezterm.action({ AdjustPaneSize = { "Down", 2 } }) },
		{ key = "K", mods = "SUPER", action = wezterm.action({ AdjustPaneSize = { "Up", 2 } }) },
		{ key = "L", mods = "SUPER", action = wezterm.action({ AdjustPaneSize = { "Right", 2 } }) },

		{ key = "f", mods = "SUPER", action = wezterm.action.ScrollByLine(-1) },
		{ key = "b", mods = "SUPER", action = wezterm.action.ScrollByLine(1) },

		{ key = "u", mods = "SUPER", action = wezterm.action.ScrollByPage(-1) },
		{ key = "d", mods = "SUPER", action = wezterm.action.ScrollByPage(1) },
		-- TAB section
		-- { key = "]", mods = "SUPER", action = wezterm.action({ ActivateTabRelativeNoWrap = 1 }) },
		-- { key = "[", mods = "SUPER", action = wezterm.action({ ActivateTabRelativeNoWrap = -1 }) },

		-- search for the string "hash" matching regardless of case
		{ key = "F", mods = "SUPER", action = wezterm.action({ Search = { CaseInSensitiveString = "hash" } }) },
		{ key = "T", mods = "SUPER", action = "ShowTabNavigator" },
		-- { key = "L", mods = "SUPER", action = "ShowLauncher" },
		{ key = "N", mods = "SUPER", action = "SpawnWindow" },
	},
}
