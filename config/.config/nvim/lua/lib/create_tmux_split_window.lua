local is_tmux = type(vim.env.TMUX) == 'string'

---
---tmux new-window
---
---@param args  table
---  - `wd` (string = cwd): working directory
---  - `sh` (string = ""): tmux panel 에서 사용될 shell 명령어
local run_tmux_new_window = function(args)
  local window_index = unpack(vim.fn.systemlist('tmux display-message -p "#W"'))
  local name = string.format('-n %s:%s', window_index, vim.fs.basename(args.wd or vim.fn.getcwd()))
  local wd = string.format('-c %s', args.wd or vim.fn.getcwd())
  local sh = args.sh and string.format('$(SHELL) "%s"', args.sh) or ''

  return string.format('tmux new-window %s %s %s', name, wd, sh)
end
local run_tmux_split_window = function(args)
  local direction = string.format('-%s', args.direction)
  local wd = string.format('-c %s', args.wd or vim.fn.getcwd())
  local sh = args.sh and string.format('$(SHELL) "%s"', args.sh) or ''

  return string.format('tmux split-window %s %s %s', direction, wd, sh)
end
local run_tmux = function(args)
  if not is_tmux then
    return vim.notify('Not in tmux',vim.log.levels.ERROR)
  end

  local commander = args.direction and run_tmux_split_window or run_tmux_new_window
  local command = commander(args)

  vim.notify(command, vim.log.levels.TRACE)

  return vim.fn.system(command)
end

---
---tmux split-window -v
---
---@param args?  table
---  - `wd` (string = cwd): working directory
---  - `sh` (string = ""): tmux panel 에서 사용될 shell 명령어
local create_tmux_split_window_vertical = function(args)
  return run_tmux(vim.tbl_extend('keep', { direction = 'v' }, args or {}))
end
---
---tmux split-window -h
---
---@param args?  table
---  - `wd` (string = cwd): working directory
---  - `sh` (string = ""): tmux panel 에서 사용될 shell 명령어
local create_tmux_split_window_horizontal = function(args)
  return run_tmux(vim.tbl_extend('keep', { direction = 'h' }, args or {}))
end
---
---tmux new-window -n
---
---@param args?  table
---  - `wd` (string = cwd): working directory
---  - `sh` (string = ""): tmux panel 에서 사용될 shell 명령어
local create_tmux_new_window = function(args)
  return run_tmux(args or {})
end

return {
  create_tmux_split_window_horizontal = create_tmux_split_window_horizontal,
  create_tmux_split_window_vertical = create_tmux_split_window_vertical,
  create_tmux_new_window = create_tmux_new_window,
}
