return {
	{
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()

      -- import mason
      local mason = require("mason")

      -- import mason-lspconfig
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup({
      })

      mason_lspconfig.setup({
        ensure_installed = {
          "ruby_ls",
          "lua_ls",
          -- "tsserver",
          -- "stimulus_ls",
        },
        automatic_installation = true,
      })

    end,
	},
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      -- lspconfig.ruby_ls.setup({
      --   cmd = { "bash", "-c", "rvm 3.3.0@ruby-lsp do bundle exec ruby-lsp --gemfile ~/.ruby-lsp/Gemfile" },
      --   -- cmd = { "BUNDLE_GEMFILE=~/.ruby-lsp/Gemfile", "rvm", "3.3.0@ruby-lsp", "do", "bundle", "exec", "ruby-lsp" }
      --   -- cmd = { "~/.ruby-lsp/launch" }
      -- })


      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
