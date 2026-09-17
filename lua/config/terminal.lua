
-- Terminal toggle functionality
local terminal_buf = nil
local terminal_win = nil

local function close_terminal()
  -- Close the terminal window if it exists and is valid
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, false)
    terminal_win = nil
  end
end

local function toggle_terminal()
  -- Check if terminal window exists and is valid
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    -- Close the terminal window
    vim.api.nvim_win_close(terminal_win, false)
    terminal_win = nil
    return
  end

  -- Create or reuse terminal buffer
  if not terminal_buf or not vim.api.nvim_buf_is_valid(terminal_buf) then
    terminal_buf = vim.api.nvim_create_buf(false, true)
  end

  -- Calculate window dimensions (80% of screen)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create floating window
  terminal_win = vim.api.nvim_open_win(terminal_buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " Terminal ",
    title_pos = "center",
  })

  -- Start terminal if buffer is empty
  if vim.api.nvim_buf_line_count(terminal_buf) == 1 and vim.api.nvim_buf_get_lines(terminal_buf, 0, 1, false)[1] == "" then
    vim.cmd("terminal")
    -- vim.cmd("terminal") may replace the buffer in the window, so capture the actual buffer
    terminal_buf = vim.api.nvim_win_get_buf(terminal_win)
  end

  -- Enter insert mode in terminal
  vim.cmd("startinsert")
end

-- Bind Ctrl+/ (which appears as Ctrl+_) to toggle terminal
vim.keymap.set({"n", "t"}, "<C-_>", toggle_terminal, { desc = "Toggle terminal", silent = true })
vim.keymap.set({"n", "t"}, "<C-/>", toggle_terminal, { desc = "Toggle terminal", silent = true })
vim.keymap.set({"t"}, "<esc><esc>", close_terminal, { desc = "Close terminal", silent = true })

