return {
    'catppuccin/nvim',
    name = "catppuccin",
    opts = {
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        }
      },
      custom_highlights = function(colors)
        local prompt = "#2d3149"

        return {
        FloatermBorder = {
          bg= prompt,
          fg = prompt,
        },
          TelescopeMatching = { fg = colors.flamingo },
          TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

          TelescopePromptPrefix = { bg = colors.surface0 },
          TelescopePromptNormal = { bg = colors.surface0 },
          TelescopeResultsNormal = { bg = colors.mantle },
          TelescopePreviewNormal = { bg = colors.mantle },
          TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
          TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
          TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
          TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
          TelescopeResultsTitle = { fg = colors.mantle },
          TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
        }
        end
    },
    priority = 1000,
    config = function (plugin, opts)
        require('catppuccin').setup(opts)
        vim.cmd('colorscheme catppuccin-mocha')
    end,
}

