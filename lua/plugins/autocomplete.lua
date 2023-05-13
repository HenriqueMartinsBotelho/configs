return {
    {
      'hrsh7th/nvim-cmp',
      event = "InsertEnter",
      opts = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
  
        -- Jump to the next slot on snippets
        vim.keymap.set({"i", "s"}, "<C-k>", function()
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          end
        end)
  
        -- Fix autopairs enter
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  
        cmp.event:on(
          'confirm_done',
          cmp_autopairs.on_confirm_done()
        )
  
        return {
          preselect = cmp.PreselectMode.None,
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end
          },
          sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
          },
          mapping = {
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
          },
          formatting = {
            format = lspkind.cmp_format({
              maxwidth = 50,
              ellipsis_char = "…"
            })
          },
        }
      end,
      dependencies = {
        'windwp/nvim-autopairs',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'onsails/lspkind.nvim',
        'saadparwaiz1/cmp_luasnip',
        {
          "L3MON4D3/LuaSnip",
          build = (not jit.os:find("Windows"))
              and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
            or nil,
          dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
          opts = {
            history = true,
            delete_check_events = "TextChanged",
          },
        },
      },
    },
  }