return {
'nvim-treesitter/nvim-treesitter',
lazy = false,
build = ':TSUpdate',
config = function()
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'php', 'javascript', 'typescript', 'vue', 'html', 'css', 'lua', 'blade', 'markdown', 'svelte', 'gdscript', 'godot_resource', 'gdshader' },
    callback = function(args)
      vim.treesitter.start(args.buf)
      -- Blade uses its own regex-based indent (indent/blade.vim)
      if args.match ~= 'blade' then
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end,
  })
end,
}
