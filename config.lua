-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.wrap = true
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 20
vim.opt.timeoutlen = 1000

vim.cmd(
  [[autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])

-- vim.g.python3_host_prog = '/Users/nrs/Library/Python/3.9/bin'
vim.g.python3_host_prog = '/usr/bin/python3'
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pylyzer" })
require("lvim.lsp.manager").setup("pyright", { root_dir = require("lspconfig").util.root_pattern(".git") })

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
lvim.use_icons = true
lvim.builtin.bufferline.active = false
lvim.builtin.project.active = false
lvim.builtin.autopairs.active = false
lvim.builtin.lir.active = false
lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git/", "node_modules" }
lvim.builtin.breadcrumbs.active = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>v"] = ":vsp<CR><C-w>l"
-- lvim.keys.normal_mode["<leader>h"] = "<cmd>nohlsearch<CR>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<leader>f"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<leader>a"] = "<cmd>lua vim.diagnostic.open_float()<CR>"

lvim.keys.normal_mode["<C-h>"] = "<C-w>h"
lvim.keys.normal_mode["<C-j>"] = "<C-w>j"
lvim.keys.normal_mode["<C-k>"] = "<C-w>k"
lvim.keys.normal_mode["<C-l>"] = "<C-w>l"

lvim.keys.normal_mode["<C-h>"] = "<CMD>NavigatorLeft<CR>"
lvim.keys.normal_mode["<C-j>"] = "<CMD>NavigatorDown<CR>"
lvim.keys.normal_mode["<C-k>"] = "<CMD>NavigatorUp<CR>"
lvim.keys.normal_mode["<C-l>"] = "<CMD>NavigatorRight<CR>"

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
local components = require('lvim.core.lualine.components')
lvim.builtin.lualine.sections.lualine_b = { components.branch }

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
lvim.colorscheme = "sonokai"
vim.g.sonokai_style = 'espresso'
vim.g.sonokai_enable_italic = '1'
vim.g.sonokai_diagnostic_text_highlight = '1'
vim.g.sonokai_diagnostic_virtual_text = 'colored'

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters, formatters and code actions <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }
-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- code_actions.setup {
--   {
--     exe = "eslint",
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require('kanagawa').setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {},
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
                bg_visual = "#43242B",
              }
            },
            wave = {},
            lotus = {},
            dragon = {},
          },
        },
        overrides = function(colors)
          return {
            CursorLineNr = { bold = false },
            Todo = { bg = "#FFA066", }
          }
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = {
          -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus"
        },
      })
    end
  },
  { "sainnhe/sonokai" },
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
    'nvim-treesitter/nvim-treesitter-context'
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
