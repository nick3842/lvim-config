-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = false
vim.opt.number = false
vim.opt.colorcolumn = "80"
vim.opt.wrap = false
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 20
vim.opt.timeoutlen = 1000

vim.cmd(
  [[autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])

vim.g.python3_host_prog = '/usr/bin/python3'
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pylyzer" })
require("lvim.lsp.manager").setup("pyright", { root_dir = require("lspconfig").util.root_pattern(".git") })

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.go",
  timeout = 1000,
}
vim.opt.guicursor="n-v-c-i:block"

lvim.use_icons = true
lvim.builtin.bufferline.active = false
lvim.builtin.project.active = false
lvim.builtin.autopairs.active = false
lvim.builtin.lir.active = false
lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git/", "node_modules" }
lvim.builtin.breadcrumbs.active = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>v"] = ":vsp<CR><C-w>l"
lvim.keys.normal_mode["<leader>p"] = "$p"
-- lvim.keys.normal_mode["<leader>h"] = "<cmd>nohlsearch<CR>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<leader>lg"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<leader>a"] = "<cmd>lua vim.diagnostic.open_float()<CR>"

lvim.keys.normal_mode["<C-h>"] = "<C-w>h"
lvim.keys.normal_mode["<C-j>"] = "<C-w>j"
lvim.keys.normal_mode["<C-k>"] = "<C-w>k"
lvim.keys.normal_mode["<C-l>"] = "<C-w>l"

lvim.keys.normal_mode["<C-h>"] = "<CMD>NavigatorLeft<CR>"
lvim.keys.normal_mode["<C-j>"] = "<CMD>NavigatorDown<CR>"
lvim.keys.normal_mode["<C-k>"] = "<CMD>NavigatorUp<CR>"
lvim.keys.normal_mode["<C-l>"] = "<CMD>NavigatorRight<CR>"

lvim.builtin.cmp.experimental.ghost_text = true
-- try to fix tmux conflict thing
lvim.keys.insert_mode["<A-j>"] = false
lvim.keys.insert_mode["<A-k>"] = false
lvim.keys.normal_mode["<A-j>"] = false
lvim.keys.normal_mode["<A-k>"] = false
lvim.keys.visual_block_mode["<A-j>"] = false
lvim.keys.visual_block_mode["<A-k>"] = false
lvim.keys.visual_block_mode["J"] = false
lvim.keys.visual_block_mode["K"] = false

lvim.keys.normal_mode['gD'] = '<CMD>Glance definitions<CR>'
lvim.keys.normal_mode['gR'] = '<CMD>Glance references<CR>'
lvim.keys.normal_mode['gY'] = '<CMD>Glance type_definitions<CR>'
lvim.keys.normal_mode['gM'] = '<CMD>Glance implementations<CR>'

lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.sections.lualine_c = { 'searchcount' }
lvim.builtin.lualine.sections.lualine_x = { 'diagnostics' }
lvim.builtin.lualine.sections.lualine_y = { 'diff' }
lvim.builtin.lualine.sections.lualine_z = { 'windows' }
lvim.builtin.lualine.sections.lualine_b = { 'branch' }
lvim.builtin.illuminate.active = false

lvim.colorscheme = "rose-pine"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1F1F28", blend = 0})
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1F1F28"})
vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none"})

lvim.plugins = {
  { "rose-pine/neovim", name='rose-pine', config = function()
    require('rose-pine').setup({
      variant = 'moon',
      -- disable_background = 'true',
      groups = {
        background = '#1B1B1B',
      },
      highlight_groups = {
        CursorLine = { bg = '#354361' },
        StatusLine = { fg = "love", bg = "love", blend = 10 },
        StatusLineNC = { fg = "subtle", bg = "surface" },
        TelescopeBorder = { fg = "highlight_high", bg = "none" },
        TelescopeNormal = { bg = "none" },
        TelescopePromptNormal = { bg = "base" },
        TelescopeResultsNormal = { fg = "subtle", bg = "none" },
        TelescopeSelection = { fg = "text", bg = "base" },
        TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
      }
    })
  end
  },
  { "tpope/vim-vinegar" },
  { "tpope/vim-repeat" },
  { "tpope/vim-abolish" },
  { 'jdhao/whitespace.nvim', event = 'VimEnter' },
  { "tpope/vim-fugitive" },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup({})
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context', config = function()
      require'treesitter-context'.setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
    end
  }

}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
