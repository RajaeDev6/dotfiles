require 'mason'.setup()
require 'mason-lspconfig'.setup({
    ensure_installed = {
        "lua_ls",
        "tsserver"
    },
})
local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr, isTsserver)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    -- vim.keymap.set('n', '<leader>ca', 'vim.lsp.buf.core_action, {}')
    vim.keymap.set('n', 'gz', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

    vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
        buffer = bufnr,
        callback = function()
            if isTsserver == true then
                require("typescript").actions.removeUnused({ sync = true })
            end
            vim.lsp.buf.format()
        end
    })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.marksman.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.solargraph.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.astro.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
lspconfig.html.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
-- lspconfig.tsserver.setup {
--     on_attach = on_attach,
--     filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "typescript.tsx", "javascript.jsx" },
--     cmd = { "typescript-language-server", "--stdio" },
--     capabilities = capabilities
-- }
lspconfig.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
lspconfig.cssmodules_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
lspconfig.eslint.setup {
    on_attach = on_attach,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'typescript', 'javascript', 'css', 'sass', 'scss', 'less' },
    capabilities = capabilities
}
lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    init_options = {
        html = {
            options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                    ["bem.enabled"] = true,
            },
        },
    }
})

local lsp_config = {
    capabilities = capabilities,
    on_attach = function(_, bufnr)
        on_attach(_, bufnr)
    end
}
require("mason-lspconfig").setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup(lsp_config)
    end,
    tsserver = function()
        require("typescript").setup({
            server = vim.tbl_extend('force', lsp_config, {
                on_attach = function(_, bufnr)
                    on_attach(_, bufnr, true)
                end,
                init_options = {
                    preferences = {
                        importModuleSpecifierPreference = 'project=relative',
                    }
                }
            })
        })
    end
})
