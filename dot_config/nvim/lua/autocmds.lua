local cmd = vim.cmd
local api = vim.api

-- Load template file from stdpath("config")/templates directory
local loadTemplate = function()
  local fname = vim.fn.expand '%:p:t'
  local tfile = api.nvim_eval('stdpath("config")') .. '/templates/' .. fname
  if vim.fn.filereadable(vim.fn.expand(tfile)) == 1 then
    vim.b.tfile = tfile
    cmd([[execute ':0r' b:tfile | normal Gddgg]])
  end
end

local loadtemplate = api.nvim_create_augroup('loadtemplate', { clear = true })
api.nvim_create_autocmd('BufNewFile', {
  pattern = '*',
  callback = function()
    vim.schedule(loadTemplate)
  end,
  group = loadtemplate
})

-- Disable autocomment on enter
local disableautocomment = api.nvim_create_augroup('disableautocomment', { clear = true })
api.nvim_create_autocmd( { 'BufEnter', 'CmdLineLeave' }, {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o',
  group = disableautocomment
})

-- Filetype detection
cmd [[
  augroup ansiblefiletype
    autocmd!
    autocmd BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
    autocmd BufRead,BufNewFile */playbooks/*.yaml set filetype=yaml.ansible
    autocmd BufRead,BufNewFile */inventory/hosts.yml set filetype=yaml.ansible
    autocmd BufRead,BufNewFile */inventory/hosts.yaml set filetype=yaml.ansible
    autocmd BufRead,BufNewFile */.chezmoiscripts/*.sh.tmpl set filetype=sh.chezmoitmpl
    autocmd BufRead,BufNewFile */.chezmoiscripts/*.fish.tmpl set filetype=fish.chezmoitmpl
  augroup END
]]

-- Filetype configuration
cmd [[
  augroup filetypesettings
    autocmd!
    autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
    autocmd FileType gitcommit setlocal colorcolumn=51,73
  augroup END
]]

-- ChoiceNode popup in snippet
cmd([[
  augroup choicepopup
    autocmd!
    autocmd User LuasnipChoiceNodeEnter lua require('utils').choice_popup(require('luasnip').session.event_node)
    autocmd User LuasnipChoiceNodeLeave lua require('utils').choice_popup_close()
    autocmd User LuasnipChangeChoice lua require('utils').update_choice_popup(require("luasnip").session.event_node)
  augroup END
]])
