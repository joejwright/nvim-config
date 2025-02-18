-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

		-- Add the autocmd for directory handling
		vim.api.nvim_create_autocmd({ "VimEnter" }, {
			callback = function(data)
				-- buffer is a directory
				local directory = vim.fn.isdirectory(data.file) == 1

				if directory then
					-- change to the directory
					vim.cmd.cd(data.file)
					-- open the tree
					require("neo-tree.command").execute({ toggle = true, dir = data.file })
				end
			end
		})
	end,
}
