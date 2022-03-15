local cmd = vim.cmd

cmd [[
  augroup k8stemplates
    autocmd!
    autocmd BufNewFile deployment.yaml 0r ~/.config/nvim/templates/deployment.yaml
    autocmd BufNewFile service.yaml 0r ~/.config/nvim/templates/service.yaml
    autocmd BufNewFile pvc.yaml 0r ~/.config/nvim/templates/pvc.yaml
    autocmd BufNewFile configmap.yaml 0r ~/.config/nvim/templates/configmap.yaml
    autocmd BufNewFile secret.yaml 0r ~/.config/nvim/templates/secret.yaml
    autocmd BufNewFile ingress-traefikCRD.yaml 0r ~/.config/nvim/templates/ingress-traefikCRD.yaml
  augroup END
]]

-- Disable autocomment on enter
cmd [[
  augroup disableautocomment
    autocmd!
    autocmd BufEnter,CmdLineLeave * set fo-=c fo-=r fo-=o
  augroup END
]]

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
