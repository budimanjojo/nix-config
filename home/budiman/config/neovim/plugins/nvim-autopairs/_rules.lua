local rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local ts_conds = require('nvim-autopairs.ts-conds')
local npairs = require('nvim-autopairs')

local function mkSpaceBracketExitRule(t)
  return rule(t[1] .. ' ', ' ' .. t[2])
    :with_pair(cond.none())
    -- this is needed so the `with_del()` method
    -- for the rule: "(|) press space => ( | )" works
    :with_del(cond.none())
    :with_move(function(opts)
      return opts.char == t[2]
    end)
    :use_key(t[2])
    -- removes the trailing whitespaces on <CR>
    :replace_map_cr(function(_)
      return '<C-c>2xi<CR><C-c>O'
    end)
end

npairs.add_rules{
  -- (|) press space => ( | )
  -- {|} press space => { | }
  -- [|] press space => [ | ]
  rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '{}', '[]' }, pair)
    end)
    -- we only want to delete the pair of spaces
    :with_del(function(opts)
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local context = opts.line:sub(col - 1, col + 2)
      return vim.tbl_contains({ '(  )', '{  }', '[  ]' }, context)
    end),

  -- ( | ) press ) => ( )|
  mkSpaceBracketExitRule({'(', ')'}),
  -- { | } press } => { }|
  mkSpaceBracketExitRule({'{', '}'}),
  -- [ | ] press ] => [ ]|
  mkSpaceBracketExitRule({'[', ']'}),

  -- <| => <|> for certain filetypes
  rule('<', '>', { 'html' })
    :with_pair(cond.not_after_regex(string.gsub([[ [%w%%%[%.] ]], "%s+", "")))
    :with_move(function(opts)
      return opts.char == '>'
    end)
    :with_pair(cond.is_bracket_line()),

  -- |; press ; => ;|
  rule('', ';')
    :with_move(function(opts) return opts.char == ';' end)
    :with_pair(cond.none())
    :with_del(cond.none())
    :with_cr(cond.none())
    :use_key(';'),

  -- a =| press <SPC> => a = |;
  -- for nix filetype
  rule('= ', ';', 'nix')
    :with_pair(function(opts)
      local prev_char = opts.line:sub(opts.col - 2, opts.col - 2)
      return prev_char:match('[^=<>!]') ~= nil
        and ts_conds.is_not_ts_node('source')(opts)
    end),

    -- with | press <SPC> => with |;
    -- for nix filetype
    rule('with ', ';', 'nix')
      :with_pair(function(opts)
        local prev_char = opts.line:sub(opts.col - 5, opts.col - 5)
        return prev_char:match('[^%w_-]') ~= nil
          and ts_conds.is_not_ts_node('source')(opts)
      end),

    -- {| press ' => {'|',},
    -- for lua filetype
    rule("'", "',", 'lua')
      :with_pair(ts_conds.is_ts_node({ 'table_constructor' })),

    -- {| press " => {"|",},
    -- for lua filetype
    rule('"', '",', 'lua')
      :with_pair(ts_conds.is_ts_node({ 'table_constructor' })),
}
