local opt = vim.opt

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.autowrite = true           -- Enable auto write
opt.conceallevel = 0           -- Hide * markup for bold and italic
opt.confirm = false            -- Confirm to save changes before exiting modified buffer
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep --threads=2 --no-heading --with-filename --line-number --smart-case --hidden --glob '!.git'"
opt.switchbuf = "useopen"
-- opt.inccommand = "nosplit" -- preview incremental substitute
opt.inccommand = "split" -- preview incremental substitute
-- opt.laststatus = 3
opt.list = false         -- Show some invisible characters (tabs...
opt.pumheight = 10       -- Maximum number of entries in a popup
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shortmess:append { W = true, I = true, c = true }
opt.showmode = false  -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.spelllang = { "en" }
opt.timeoutlen = 300
opt.timeout = true
opt.undolevels = 10000
opt.autoread = true                -- auto read file if changed outside of vim
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.showmatch = true               -- highlight matching [{()}]
opt.hidden = true
opt.title = true
opt.backup = false

opt.showcmd = true
opt.cmdheight = 0
opt.laststatus = 0

opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })

-- recursive :find in current dir
vim.cmd [[set path=.,,,$PWD/**]]

opt.splitkeep = "screen"

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Enable relative line numbers
opt.number = true          -- Print line number
opt.relativenumber = false -- Relative line numbers

-- Set tabs to 2 spaces
opt.tabstop = 2      -- Number of spaces tabs count for
opt.softtabstop = 2
opt.expandtab = true -- Use spaces instead of tabs
opt.smarttab = true

-- Enable auto indenting and set it to spaces
opt.autoindent = true
opt.smartindent = true -- Insert indents automatically
opt.shiftwidth = 2     -- Size of an indent
opt.shiftround = true  -- Round indent

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
opt.breakindent = true

-- Enable incremental searching
opt.incsearch = true
opt.hlsearch = true

-- Disable text wrap
opt.wrap = true

-- Better splitting
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current

-- Enable mouse mode
opt.mouse = "a"

-- Enable ignorecase + smartcase for better searching
opt.ignorecase = true -- Ignore case
opt.smartcase = true  -- Don't ignore case with capitals

-- Save swap file and trigger CursorHold
opt.updatetime = 200

-- Enable persistent undo history
opt.undofile = true

-- Enable 24-bit color
opt.termguicolors = true -- True color support

-- Enable the sign column to prevent the screen from jumping
opt.signcolumn = "yes"

-- Enable access to System Clipboard
-- vim.opt.clipboard = "unnamed,unnamedplus"
opt.clipboard = "unnamedplus"

-- Enable cursor line highlight
opt.cursorline = true

opt.fillchars = {
  fold = " ",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Always keep N lines above/below cursor unless at start/end of file
opt.scrolloff = 10 -- Lines of context
