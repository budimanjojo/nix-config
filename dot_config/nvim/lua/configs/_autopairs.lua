local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local npairs = require('nvim-autopairs')
local ignored_next_char = string.gsub([[ [%w%%%[%.] ]],"%s+", "")

npairs.setup {
  ignored_next_char = ignored_next_char
}

npairs.add_rule(
  Rule('<', '>')
    :with_pair(cond.not_after_regex(ignored_next_char))
    :with_move(function(opts)
      return opts.char == '>'
    end)
    :with_pair(cond.is_bracket_line())
)

-- (|) press space => ( | )
-- ( | ) press ) => ( )|
npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '{}', '[]' }, pair)
    end),
  Rule('( ', ' )')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%)') ~= nil
    end)
    :use_key(')'),
  Rule('{ ', ' }')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%}') ~= nil
    end)
    :use_key(')'),
  Rule('[ ', ' ]')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%]') ~= nil
    end)
    :use_key(')'),
}
