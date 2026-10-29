-- Delete a buffer but keep its windows open (showing another buffer instead), so closing
-- the last file doesn't leave a sidebar like neo-tree as the only window.
return function(buf, force)
  buf = (buf == nil or buf == 0) and vim.api.nvim_get_current_buf() or buf

  -- Special buffers (neo-tree, help, quickfix, ...) are deleted normally, closing their window.
  if vim.bo[buf].buftype ~= '' or not vim.bo[buf].buflisted then
    vim.cmd.bdelete({ args = { buf }, bang = force })
    return
  end

  if vim.bo[buf].modified and not force then
    vim.notify('E89: No write since last change for buffer ' .. buf, vim.log.levels.ERROR)
    return
  end

  for _, win in ipairs(vim.fn.win_findbuf(buf)) do
    vim.api.nvim_win_call(win, function()
      local alt = vim.fn.bufnr('#')
      if alt > 0 and alt ~= buf and vim.bo[alt].buflisted then
        vim.cmd.buffer(alt)
      else
        vim.cmd.bprevious()
      end
      if vim.api.nvim_win_get_buf(win) == buf then
        vim.cmd.enew()
      end
    end)
  end

  if vim.api.nvim_buf_is_valid(buf) then
    vim.cmd.bdelete({ args = { buf }, bang = true })
  end
end
