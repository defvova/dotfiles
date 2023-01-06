local present, package = pcall(require, "package-info")

if not present then
  return
end

local options = {}

package.setup(options)
