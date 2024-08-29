-- basic formatting options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = false
vim.opt.colorcolumn = "80"
vim.opt.wrap = false
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 20
vim.opt.timeoutlen = 1000

vim.g.python3_host_prog = '/usr/bin/python3'

-- format on save for go files
lvim.format_on_save = {
  enabled = true,
  pattern = "*.go",
  timeout = 1000,
}

-- remember where I left off in the file
vim.cmd(
  [[autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])

vim.opt.guicursor="n-v-c-i:block"

-- get rid of plugins I don't want
lvim.builtin.bufferline.active = false
lvim.builtin.project.active = false
lvim.builtin.autopairs.active = false
lvim.builtin.lir.active = false
lvim.builtin.breadcrumbs.active = false
lvim.builtin.illuminate.active = false
lvim.builtin.nvimtree.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.remove_keymaps = true
-- get rid of plugins I don't want

lvim.builtin.which_key.mappings["e"] = nil

lvim.leader = "space"
lvim.keys.normal_mode["<leader>v"] = ":vsp<CR><C-w>l"
lvim.keys.normal_mode["<leader>v"] = ":vsp<CR><C-w>l"
lvim.keys.normal_mode["<leader>p"] = "$p"

lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git/", "node_modules" }
lvim.keys.normal_mode["<leader>lg"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<leader>a"] = "<cmd>lua vim.diagnostic.open_float()<CR>"

lvim.keys.normal_mode["<leader>ee"] = "<INSERT>if err != nil {<CR>}<ESC>O"
lvim.keys.normal_mode["<C-h>"] = "<C-w>h"
lvim.keys.normal_mode["<C-j>"] = "<C-w>j"
lvim.keys.normal_mode["<C-k>"] = "<C-w>k"
lvim.keys.normal_mode["<C-l>"] = "<C-w>l"

lvim.keys.normal_mode["<C-h>"] = "<CMD>NavigatorLeft<CR>"
lvim.keys.normal_mode["<C-j>"] = "<CMD>NavigatorDown<CR>"
lvim.keys.normal_mode["<C-k>"] = "<CMD>NavigatorUp<CR>"
lvim.keys.normal_mode["<C-l>"] = "<CMD>NavigatorRight<CR>"

lvim.colorscheme = "edge"

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

lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.sections.lualine_c = { 'searchcount' }
lvim.builtin.lualine.sections.lualine_x = { 'diagnostics' }
lvim.builtin.lualine.sections.lualine_y = { 'diff' }
lvim.builtin.lualine.sections.lualine_z = { 'windows' }
lvim.builtin.lualine.sections.lualine_b = { 'branch' }
lvim.builtin.lualine.sections.lualine_a = { 'mode' }

lvim.plugins = {
  { "tpope/vim-vinegar" },
  { "tpope/vim-vinegar" },
  { "sainnhe/edge", config = function ()
    vim.g.edge_transparent_background = 1
  end },
  { "tpope/vim-repeat" },
  { "tpope/vim-abolish" },
  { "tpope/vim-fugitive" },
  { 'jdhao/whitespace.nvim', event = 'VimEnter' },
  { "kylechui/nvim-surround", config = function()
      require("nvim-surround").setup({})
    end
  },
  { "numToStr/Navigator.nvim", config = function()
      require("Navigator").setup({})
    end
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    opts = {
      dependencies = {
        -- Manage libuv types with lazy. Plugin will never be loaded
        { "Bilal2453/luvit-meta", lazy = true },
      },
      library = {
        { path = "~/workspace/avante.nvim/lua", words = { "avante" } },
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { 'nvim-treesitter/nvim-treesitter-context' },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make tiktoken",
    opts = {
      provider = "claude",
      debug = true,
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}
