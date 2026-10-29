-- gd on <x-component> or on a view name (@include('partials.nav'), @extends, view(), ...)
-- opens its Blade file; anything else falls back to the LSP definition.

local function view_file(root, name)
  local path = root .. '/resources/views/' .. name:gsub('%.', '/')
  local last = path:match('[^/]+$')
  for _, candidate in ipairs({
    path .. '.blade.php',
    path .. '/index.blade.php',
    path .. '/' .. last .. '.blade.php',
  }) do
    if vim.uv.fs_stat(candidate) then
      return candidate
    end
  end
end

local function component_file(root, name)
  local view = view_file(root, 'components.' .. name)
  if view then
    return view
  end
  -- Class-only components: forms.input-text -> app/View/Components/Forms/InputText.php
  local segments = vim.tbl_map(function(s)
    return (s:gsub('^%l', string.upper):gsub('%-(%w)', string.upper))
  end, vim.split(name, '.', { plain = true }))
  local class = root .. '/app/View/Components/' .. table.concat(segments, '/') .. '.php'
  if vim.uv.fs_stat(class) then
    return class
  end
end

local function target_under_cursor()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1

  for s, name, e in line:gmatch('()</?x%-([%w%.:-]+)()') do
    if col >= s and col < e then
      if name:match('^slot') or name == 'dynamic-component' or name:find('::') then
        return nil
      end
      return 'component', name
    end
  end

  for s, name, e in line:gmatch('()[\'"]([%w%._/:-]+)[\'"]()') do
    if col >= s and col < e then
      return 'view', name
    end
  end

  -- On the directive itself, e.g. @include or @includeWhen($cond, 'view'): use its first string.
  for s, e in line:gmatch('()@%a+()') do
    if col >= s and col < e then
      local name = line:match('[\'"]([%w%._/:-]+)[\'"]', e)
      return name and 'view', name
    end
  end
end

vim.keymap.set('n', 'gd', function()
  local root = vim.fs.root(0, 'artisan')
  local kind, name = target_under_cursor()
  local file = root and name and (kind == 'component' and component_file(root, name) or view_file(root, name))
  if file then
    vim.cmd.edit(vim.fn.fnameescape(file))
  else
    vim.cmd('Telescope lsp_definitions')
  end
end, { buffer = true, desc = 'Go to Blade view/component or LSP definition' })

vim.b.undo_ftplugin = (vim.b.undo_ftplugin or '') .. ' | silent! nunmap <buffer> gd'
