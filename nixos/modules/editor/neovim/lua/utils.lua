local M = {}

-- Returns `cwd` or path of current buffer depending on whether the current window is terminal or nothing
function M.current_path()
  local current_win_info = vim.fn["getwininfo"](vim.api.nvim_get_current_win())
  if current_win_info == nil or #current_win_info == 0 then
    return vim.fn["getcwd"]()
  end
  return vim.fn.expand("%:p:h")
end

-- Workaround for hover not working when there is diagnostic float
-- https://www.reddit.com/r/neovim/comments/pg1o6k/neovim_lsp_hover_window_is_hidden_behind_line
function M.fix_buf_hover()
  vim.o.eventignore = 'CursorHold'
  vim.lsp.buf.hover()
  vim.cmd([[autocmd CursorMoved <buffer> ++once set eventignore=""]])
end

-- LuaSnip popup when there are choices
-- https://github.com/L3MON4D3/LuaSnip/wiki/Misc#choicenode-popup
local current_nsid = vim.api.nvim_create_namespace('LuaSnipChoiceListSelections')
local current_win = nil

local function window_for_choiceNode(choiceNode)
  local buf = vim.api.nvim_create_buf(false, true)
  local buf_text = {}
  local row_selection = 0
  local row_offset = 0
  local text
  for _, node in ipairs(choiceNode.choices) do
      text = node:get_docstring()
      -- find one that is currently showing
      if node == choiceNode.active_choice then
        -- current line is starter from buffer list which is length usually
        row_selection = #buf_text
        -- finding how many lines total within a choice selection
        row_offset = #text
      end
      vim.list_extend(buf_text, text)
  end
  vim.api.nvim_buf_set_text(buf, 0, 0, 0, 0, buf_text)
  local w, h = vim.lsp.util._make_floating_popup_size(buf_text)
  -- adding highlight so we can see which one is being selected
  local extmark = vim.api.nvim_buf_set_extmark(buf, current_nsid, row_selection, 0, {
    hl_group = 'incsearch',
    end_line = row_selection + row_offset
  })
  -- shows window at a beginning of choiceNode
  local win = vim.api.nvim_open_win(buf, false, {
    relative = "win",
    width = w,
    height = h,
    bufpos = choiceNode.mark:pos_begin_end(),
    style = "minimal",
    border = 'rounded'
  })
  -- return with 3 main important so we can use them again
  return { win_id = win, extmark = extmark, buf = buf }
end

function M.choice_popup(choiceNode)
  -- build stack for nested choiceNodes.
  if current_win then
    vim.api.nvim_win_close(current_win.win_id, true)
    vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
  end
  local create_win = window_for_choiceNode(choiceNode)
  current_win = {
    win_id = create_win.win_id,
    prev = current_win,
    node = choiceNode,
    extmark = create_win.extmark,
    buf = create_win.buf
  }
end

function M.update_choice_popup(choiceNode)
  vim.api.nvim_win_close(current_win.win_id, true)
  vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
  local create_win = window_for_choiceNode(choiceNode)
  current_win.win_id = create_win.win_id
  current_win.extmark = create_win.extmark
  current_win.buf = create_win.buf
end

function M.choice_popup_close()
  vim.api.nvim_win_close(current_win.win_id, true)
  vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
  -- now we are checking if we still have previous choice we were in after exit nested choice
  current_win = current_win.prev
  if current_win then
    -- reopen window further down in the stack.
    local create_win = window_for_choiceNode(current_win.node)
    current_win.win_id = create_win.win_id
    current_win.extmark = create_win.extmark
    current_win.buf = create_win.buf
  end
end

-- Make sure indenting `#` works even if `smartindent` and `cindent` is on
function M.always_working_indent_line()
  -- get the current settings
  local smartindent = vim.o.smartindent
  local cindent = vim.o.cindent

  -- set smartindent and cindent off
  vim.o.smartindent = false
  vim.o.cindent = false

  -- indent the line
  vim.api.nvim_feedkeys('>>', 'x', true)

  -- reset it back to previous settings
  vim.o.smartindent = smartindent
  vim.o.cindent = cindent
end

return M
