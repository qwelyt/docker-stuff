local present1, lspconfig = pcall(require, "lspconfig")
local present2, lspinstall = pcall(require, "lspinstall")

if not (present1 or present2) then
   return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
   properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
   },
}


-- lspInstall + lspconfig stuff

local function setup_servers()
   lspinstall.setup()
   local servers = lspinstall.installed_servers()

   for _, lang in pairs(servers) do
      if lang ~= "lua" then
         lspconfig[lang].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = {
               debounce_text_changes = 500,
            },
            -- root_dir = vim.loop.cwd,
         }
      elseif lang == "lua" then
         lspconfig[lang].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = {
               debounce_text_changes = 500,
            },
            settings = {
               Lua = {
                  diagnostics = {
                     globals = { "vim" },
                  },
                  workspace = {
                     library = {
                        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                        [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                     },
                     maxPreload = 100000,
                     preloadFileSize = 10000,
                  },
                  telemetry = {
                     enable = false,
                  },
               },
            },
         }
      end
   end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function()
   setup_servers() -- reload installed servers
   vim.cmd "bufdo e"
end
