local present, noice = pcall(require, "noice")

if not present then
  return
end

local options = {
  notify = {
    enabled = false,
  },
  messages = {
    enabled = false,
  },
}

noice.setup(options)
