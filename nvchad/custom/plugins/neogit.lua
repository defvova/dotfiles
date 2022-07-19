local present, neogit = pcall(require, "neogit")

if not present then
  return
end

local options = {
  signs = {
    -- { CLOSED, OPENED }
    section = { "", "" },
    item = { "", "" },
    hunk = { "", "" },
  },
  integrations = { diffview = true },
}

neogit.setup(options)
