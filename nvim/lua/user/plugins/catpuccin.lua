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
            bg = prompt,
            fg = prompt,
          },
        }
      end
    },
    priority = 1000,
    config = function (plugin, opts)
        require('catppuccin').setup(opts)
        vim.cmd('colorscheme catppuccin-mocha')
    end,
}

