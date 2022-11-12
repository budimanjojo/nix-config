local actions = require'lir.actions'
local lir = require('lir')
local utils = lir.utils
local config = lir.config
local Path = require('plenary.path')

local function lcd(path)
  vim.cmd(string.format(':lcd %s', path))
end

local no_confirm_patterns = {
  '^LICENSE$',
  '^Makefile$',
  '^README',
}

local need_confirm = function(filename)
  for _, pattern in ipairs(no_confirm_patterns) do
    if filename:match(pattern) then
      return false
    end
  end
  return true
end

-- Create new directory if the string ends with '/' or new file
local function new_file_or_dir()
  local save_curdir = vim.fn.getcwd()
  lcd(lir.get_context().dir)
  local name = vim.fn.input('New file / directory: ', '', 'file')
  lcd(save_curdir)

  if name == '' then
    return
  end

  if name == '.' or name == '..' then
    utils.error('Invalid file name: ' .. name)
    return
  end

  -- If I need to check, I will.
  if need_confirm(name) then
    -- '.' is not included or '/' is not included, then
    -- I may have entered it as a directory, I'll check.
    if not name:match('%.') and not name:match('/') then
      if vim.fn.confirm("Directory?", "&No\n&Yes", 1) == 2 then
        name = name .. '/'
      end
    end
  end

  local path = Path:new(lir.get_context().dir .. name)
  if string.match(name, '/$') then
    -- mkdir
    name = name:gsub('/$', '')
    path:mkdir({
      parents = true,
      mode = tonumber('700', 8),
      exists_ok = false
    })
  else
    -- touch
    path:touch({
      parents = true,
      mode = tonumber('644', 8),
    })
  end

  -- If the first character is '.' and show_hidden_files is false, set it to true
  if name:match([[^%.]]) and not config.values.show_hidden_files then
    config.values.show_hidden_files = true
  end

  actions.reload()

  -- Jump to a line in the parent directory of the file you created.
  local lnum = lir.get_context():indexof(name:match('^[^/]+'))
  if lnum then
    vim.cmd(tostring(lnum))
  end
end

lir.setup {
  show_hidden_files = false,
  devicons_enable = true,
  hide_cursor = true,
  mappings = {
    ['h']     = actions.up,
    ['l']     = actions.edit,
    ['<CR>']  = actions.edit,
    ['q']     = actions.quit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,
    ['.']     = actions.toggle_show_hidden,
    ['r']     = actions.rename,
    ['Y']     = actions.yank_path,
    ['D']     = actions.delete,
    ['a']     = new_file_or_dir,
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = false,
      highlight_dirname = false
    },
    win_opts = function()
      return {
        relative = 'editor',
        style = 'minimal',
        border = 'single',
      }
    end,
  },
  on_init = function()
    vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
  end,
}

require ('lir.git_status').setup {
  show_ignored = false
}
