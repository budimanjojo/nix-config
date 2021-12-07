vim.cmd([[
  augroup k8stemplates
    autocmd!
    autocmd BufNewFile deployment.yaml 0r ~/.config/nvim/templates/deployment.yaml
    autocmd BufNewFile service.yaml 0r ~/.config/nvim/templates/service.yaml
    autocmd BufNewFile pvc.yaml 0r ~/.config/nvim/templates/pvc.yaml
    autocmd BufNewFile configmap.yaml 0r ~/.config/nvim/templates/configmap.yaml
    autocmd BufNewFile secret.yaml 0r ~/.config/nvim/templates/secret.yaml
    autocmd BufNewFile ingress-traefikCRD.yaml 0r ~/.config/nvim/templates/ingress-traefikCRD.yaml
]])
