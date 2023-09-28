local api = vim.api

-- Disable removing indentation on files when first letter is # except some filetypes
local disabledeindenthastag = api.nvim_create_augroup('disabledeindenthastag', { clear = true })
api.nvim_create_autocmd('FileType', {
  pattern = '*\\(^c$\\|^cpp$\\)\\@<!',
  callback = function()
    vim.opt.cinkeys:remove({ '0#' })
  end,
  group = disabledeindenthastag
})

-- Disable autocomment on enter
local disableautocomment = api.nvim_create_augroup('disableautocomment', { clear = true })
api.nvim_create_autocmd({ 'BufEnter', 'CmdLineLeave' }, {
  pattern = '*',
  callback = function()
    vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
  end,
  group = disableautocomment
})

-- Filetype detection
local detectFt = function()
  local fpath = vim.fn.expand '%:p'
  if string.match(fpath, '.*/playbooks/.*%.yaml') or string.match(fpath, '.*/playbooks/.*%.yml') then
    vim.o.filetype = 'yaml.ansible'
  elseif string.match(fpath, '.*/inventory/hosts%.yaml') or string.match(fpath, '.*/inventory/hosts%.yml') then
    vim.o.filetype = 'yaml.ansible'
  elseif string.match(fpath, '.*/%.chezmoiscripts/.*%.sh.tmpl') then
    vim.o.filetype = 'sh.chezmoitmpl'
  elseif string.match(fpath, '.*/%.chezmoiscripts/.*%.fish.tmpl') then
    vim.o.filetype = 'fish.chezmoitmpl'
  end
end

local ftdetection = api.nvim_create_augroup('ftdetection', { clear = true })
api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*',
  callback = function()
    vim.schedule(detectFt)
  end,
  group = ftdetection
})

-- Filetype configuration
local ftconfiguration = api.nvim_create_augroup('ftconfiguration', { clear = true })
api.nvim_create_autocmd({ 'FileType' }, {
  pattern = '*',
  callback = function(arg)
    local ft = arg.match
    if ft == 'go' then
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.softtabstop = 4
      vim.opt_local.expandtab = false
    elseif ft == 'gitcommit' then
      vim.opt_local.colorcolumn = { 73 }
    end
  end,
  group = ftconfiguration
})

-- Close some filetypes with <q>
local closewithq = api.nvim_create_augroup('closewithq', { clear = true })
api.nvim_create_autocmd({ 'FileType' }, {
  pattern = {
    'PlenaryTestPopup',
    'help',
    'lspinfo',
    'man',
    'notify',
    'qf',
    'query',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'neotest-output',
    'checkhealth',
    'neotest-summary',
    'neotest-output-panel',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = event.buf, silent = true })
  end,
  group = closewithq
})

-- Auto imports and format on save for golang
local autoimportformatgo = api.nvim_create_augroup('autoimportformatgo', { clear = true })
api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { 'source.organizeImports' } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or 'utf-16'
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end,
  group = autoimportformatgo
})

-- ChoiceNode popup in snippet
local choicepopup = api.nvim_create_augroup('choicepopup', { clear = true })
api.nvim_create_autocmd('User', {
  pattern = { 'LuasnipChoiceNodeEnter', 'LuasnipChoiceNodeLeave', 'LuasnipChangeChoice' },
  callback = function(arg)
    local match = arg.match
    if match == 'LuasnipChoiceNodeEnter' then
      require('utils').choice_popup(require('luasnip').session.event_node)
    elseif match == 'LuasnipChoiceNodeLeave' then
      require('utils').choice_popup_close()
    elseif match == 'LuasnipChangeChoice' then
      require('utils').update_choice_popup(require('luasnip').session.event_node)
    end
  end,
  group = choicepopup
})
