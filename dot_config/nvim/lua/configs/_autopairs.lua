local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.setup{}

npairs.add_rule(
  Rule('<','>')
)
