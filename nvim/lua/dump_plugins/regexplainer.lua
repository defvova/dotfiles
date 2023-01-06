local present, regexplainer = pcall(require, "regexplainer")

if not present then
  return
end

local options = {
  auto = true,
  filetypes = {
    "html",
    "js",
    "cjs",
    "mjs",
    "ts",
    "jsx",
    "tsx",
    "cjsx",
    "mjsx",
    "lua",
    "ruby",
    "rb",
  },
  mappings = {
    toggle = "R",
  },
}

regexplainer.setup(options)
