return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- import mason
			local mason = require("mason")

			-- import mason-lspconfig
			local mason_lspconfig = require("mason-lspconfig")

			mason.setup({})

			mason_lspconfig.setup({

				ensure_installed = {
					"ruby_lsp",
					"lua_ls",
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

			-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

      _timers = {}
      local function setup_diagnostics(client, buffer)
        if require("vim.lsp.diagnostic")._enable then
          return
        end

        local diagnostic_handler = function()
          local params = vim.lsp.util.make_text_document_params(buffer)
          client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
            if err then
              local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
              vim.lsp.log.error(err_msg)
            end
            local diagnostic_items = {}
            if result then
              diagnostic_items = result.items
            end
            vim.lsp.diagnostic.on_publish_diagnostics(
              nil,
              vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
              { client_id = client.id }
            )
          end)
        end

        diagnostic_handler() -- to request diagnostics on buffer when first attaching

        vim.api.nvim_buf_attach(buffer, false, {
          on_lines = function()
            if _timers[buffer] then
              vim.fn.timer_stop(_timers[buffer])
            end
            _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
          end,
          on_detach = function()
            if _timers[buffer] then
              vim.fn.timer_stop(_timers[buffer])
            end
          end,
        })
      end

      local function add_ruby_deps_command(client, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, "ShowRubyDeps",
          function(opts)

            local params = vim.lsp.util.make_text_document_params()

            local showAll = opts.args == "all"

            client.request("rubyLsp/workspace/dependencies", params,
              function(error, result)
                if error then
                  print("Error showing deps: " .. error)
                  return
                end

                local qf_list = {}
                for _, item in ipairs(result) do
                  if showAll or item.dependency then
                    table.insert(qf_list, {
                      text = string.format("%s (%s) - %s",
                        item.name,
                        item.version,
                        item.dependency),

                      filename = item.path
                    })
                  end
                end

                vim.fn.setqflist(qf_list)
                vim.cmd('copen')
              end, bufnr)
          end, {nargs = "?", complete = function()
            return {"all"}
          end})
      end

			-- requires rvm use 3.3.0@ruby-lsp --create --ruby-version
			-- bundle binstubs ruby-lsp
			lspconfig.ruby_lsp.setup({
				-- cmd = { "bash", "-c", "rvm 3.3.0@ruby-lsp do ~/.ruby/ruby-lsp/bin/ruby-lsp" },
				capabilities = capabilities,
        on_attach = function(client, buffer)
          setup_diagnostics(client, buffer)
          add_ruby_deps_command(client, buffer)
        end,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
