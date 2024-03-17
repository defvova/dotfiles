local wezterm = require 'wezterm'
local config = wezterm.config_builder()
if wezterm.config_builder then
  config = wezterm.config_builder()
end

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Night Owl (Gogh)'
  else
    return 'One Light (Gogh)'
  end
end

config.font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true })
config.font_size = 14.0
config.line_height = 1.1
-- config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- disable ligatures

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_padding = {
  left = 8,
  right = 5,
  top = 50,
  bottom = 0,
}
config.adjust_window_size_when_changing_font_size = false

config.color_scheme = scheme_for_appearance(get_appearance())
return config
