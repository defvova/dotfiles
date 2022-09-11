local present, neotest = pcall(require, "neotest")

if not present then
  return
end

local options = {
status = {
    virtual_text = true,
    },
    strategies = {
    integrated = {
        width = 180,
    },
    },
    adapters = {
        require "neotest-rspec",
        require "neotest-jest",
        require "neotest-rust",
    },
    consumers = {
        overseer = require "neotest.consumers.overseer",
      },
      overseer = {
        enabled = true,
        force_default = true,
      },
}

neotest.setup(options)
