local cmp = require('cmp')

require("luasnip.loaders.from_vscode").lazy_load()
require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })

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
            require('luasnip').lsp_expand(args.body)
            end,
    },
    sources= cmp.config.sources({
        { name = 'nvim-lsp' },
        {name = 'luasnip'},
        {name = 'snippy'},
        {name = 'vsnip'},
        {name = 'ultisnips'},
    }, {
        { name = 'buffer' },
    }),
    window = {
        completion = cmp.config.window.bordered({border = double}),
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = "A",
                buffer = "b"
            }
        item.menu = menu_icon[entry.source.name]
        return item
        end,
    }
})
