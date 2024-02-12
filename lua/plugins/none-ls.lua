return {
	"nvimtools/none-ls.nvim",

	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- commented out since formatting is very opinionated
				-- null_ls.builtins.diagnostics.rubocop.with({
				--       command = "/home/joew/.ruby/rubocop/bin/rubocop"
				--     }),
				--
        --
				-- requires rvm use 3.3.0@rubocop --create --ruby-version
				-- bundle binstubs rubocop
				null_ls.builtins.formatting.rubocop.with({
					command = "~/.ruby/rubocop/bin/rubocop",
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
