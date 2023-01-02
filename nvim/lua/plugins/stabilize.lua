local present, stabilize = pcall(require, "stabilize")

if not present then
  return
end

local options = {
  nested = "QuickFixCmdPost,DiagnosticChanged *",
}

stabilize.setup(options)
