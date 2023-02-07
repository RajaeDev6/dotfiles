local cmp = require('cmp')
local  luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.filetype_extend("javascript", { "javascriptreact","html", "typescriptreact", "typescript" })

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true}),
    },

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
            end,
    },
    sources= cmp.config.sources({
        { name = 'path'},
        { name = 'nvim-lsp' },
        {name = 'luasnip', keyword_length = 2},
        { name = 'buffer'},
    }),
    
    window = {
        completion = cmp.config.window.bordered({border = double}),
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = "[LSP]",
                buffer = "[BUF]",
                luasnip = "[LSNIP]",
                vsnip = "[VSNIP]",
                path = "[PATH]"
            }
        item.menu = menu_icon[entry.source.name]
        return item
        end,
    }
})
