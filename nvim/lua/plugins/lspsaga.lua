local present, lspsaga = pcall(require, "lspsaga")

if not present then
  return
end

local options = {
  code_action_icon = " ",
  code_action_prompt = {
    virtual_text = false,
  },
}

lspsaga.setup(options)
