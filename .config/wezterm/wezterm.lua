local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window {}
  window:gui_window():maximize()
end)

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
    return 'Edge Light (base16)'
  end
end

config.disable_default_key_bindings = true
config.window_close_confirmation = 'AlwaysPrompt'

config.front_end = "WebGpu"
config.max_fps = 120
config.webgpu_power_preference = "HighPerformance"

-- config.font = wezterm.font('JetBrains Mono', { weight = 'Book', italic = true })
config.font = wezterm.font('MesloLGS Nerd Font Mono', { weight = 'Medium', italic = true })
config.font_size = 15.0
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

-- config.color_scheme = scheme_for_appearance(get_appearance())
-- INFO: https://wezfurlong.org/wezterm/config/lua/wezterm.color/save_scheme.html#weztermcolorsave_schemecolors-metadata-file_name
-- colors, metadata = wezterm.color.load_base16_scheme("/Users/vova/.config/wezterm/themes/edge-light.yaml")
-- wezterm.color.save_scheme(colors, metadata, "/Users/vova/.config/wezterm/themes/edge-light.toml")
-- local lightScheme = wezterm.get_builtin_color_schemes()['Edge Light (base16)']
-- lightScheme.foreground = '#4b505b'
-- lightScheme.selection_bg = '#dde2e7'
-- lightScheme.selection_fg = '#4b505b'
-- -- lightScheme.cursor_bg = '#6996e0'
-- -- lightScheme.cursor_border = '#6996e0'
--
-- config.color_schemes = {
--   ['Edge Light (base16)'] = lightScheme,
-- }
config.color_scheme = 'Tokyo Night Storm (Gogh)'

local act = wezterm.action
config.mouse_bindings = {
  {
    event = { Down = { streak = 3, button = 'Left' } },
    action = act.SelectTextAtMouseCursor 'Line',
    mods = 'NONE',
  },
}

config.keys = {
  { key = 'L', mods = 'CTRL', action = act.ShowDebugOverlay },
  {
    key = 'P',
    mods = 'CTRL',
    action = wezterm.action.ActivateCommandPalette,
  },
  {
    key = 'c',
    mods = 'CMD',
    action = act.CopyTo 'Clipboard',
  },
  { key = 'v', mods = 'CMD',  action = act.PasteFrom 'Clipboard' },
  {
    key = 'R',
    mods = 'CMD',
    action = act.ClearScrollback 'ScrollbackAndViewport',
  },
  { key = '[', mods = 'CMD', action = act.ScrollByPage(-0.5) },
  { key = ']', mods = 'CMD', action = act.ScrollByPage(0.5) },
  -- SEARCH
  {
    key = 'f',
    mods = 'CMD',
    action = act.Search("CurrentSelectionOrEmptyString")
  },
  -- TAB
  { key = '{', mods = 'CMD', action = act.ActivateTabRelative(-1) },
  { key = '}', mods = 'CMD', action = act.ActivateTabRelative(1) },
  {
    key = 't',
    mods = 'CMD',
    action = act.SpawnTab 'CurrentPaneDomain'
  },
  {
    key = '0',
    mods = 'CMD',
    action = act.ActivateLastTab,
  },
  -- PANE
  {
    key = 'w',
    mods = 'CMD',
    action = act.CloseCurrentPane { confirm = true },
  },
  {
    key = '\\',
    mods = 'CMD',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'CMD',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'H',
    mods = 'CMD',
    action = act.AdjustPaneSize { 'Left', 10 },
  },
  {
    key = 'J',
    mods = 'CMD',
    action = act.AdjustPaneSize { 'Down', 10 },
  },
  { key = 'K', mods = 'CMD', action = act.AdjustPaneSize { 'Up', 10 } },
  {
    key = 'L',
    mods = 'CMD',
    action = act.AdjustPaneSize { 'Right', 10 },
  },
  {
    key = 'h',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Down',
  },
}

for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CMD',
    action = act.ActivateTab(i - 1),
  })
end

return config
