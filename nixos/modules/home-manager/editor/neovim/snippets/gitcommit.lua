local ls = require('luasnip')
local s = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local choice = ls.choice_node
local nonempty = require('luasnip.extras').nonempty

return {
  s({
    trig = 'cc',
    name = 'conventional commit',
    dscr = 'Conventional commit',
  }, {
    choice(1, {
      text('feat'), text('fix'), text('doc'), text('chore'),
    }),
    nonempty(2, '(', ''),
    insert(2, 'scope'),
    nonempty(2, ')', ''),
    text(': '),
    insert(3, 'title'),
    insert(0),
  }),

  s({
    trig = 'fix',
    name = 'fix conventional commit',
    dscr = 'Fix conventional commit',
  }, {
    text('fix'),
    nonempty(1, '(', ''),
    insert(1, 'scope'),
    nonempty(1, ')', ''),
    text(': '),
    insert(2, 'title'),
    insert(0),
  }),

  s({
    trig = 'feat',
    name = 'feat conventional commit',
    dscr = 'Feat conventional commit',
  }, {
    text('feat'),
    nonempty(1, '(', ''),
    insert(1, 'scope'),
    nonempty(1, ')', ''),
    text(': '),
    insert(2, 'title'),
    insert(0),
  }),

  s({
    trig = 'chore',
    name = 'chore conventional commit',
    dscr = 'Chore conventional commit',
  }, {
    text('chore'),
    nonempty(1, '(', ''),
    insert(1, 'scope'),
    nonempty(1, ')', ''),
    text(': '),
    insert(2, 'title'),
    insert(0),
  }),

  s({
    trig = 'docs',
    name = 'docs conventional commit',
    dscr = 'Docs conventional commit',
  }, {
    text('docs'),
    nonempty(1, '(', ''),
    insert(1, 'scope'),
    nonempty(1, ')', ''),
    text(': '),
    insert(2, 'title'),
    insert(0),
  }),

  s({
    trig = 'cc!',
    name = 'conventional commit breaking',
    dscr = 'Conventional commit with breaking change(s)',
  }, {
    choice(1, {
      text('feat!'), text('fix!'),
    }),
    nonempty(2, '(', ''),
    insert(2, 'scope'),
    nonempty(2, ')', ''),
    text(': '),
    insert(3, 'title'),
    text({'', '', 'BREAKING CHANGE: '}),
    insert(0),
  }),

  s({
    trig = 'feat!',
    name = 'feat conventional commit breaking',
    dscr = 'feat conventional commit with breaking change(s)',
  }, {
    text('feat!'),
    nonempty(1, '(', ''),
    insert(1, 'scope'),
    nonempty(1, ')', ''),
    text(': '),
    insert(2, 'title'),
    text({'', '', 'BREAKING CHANGE: '}),
    insert(0),
  }),

  s({
    trig = 'fix!',
    name = 'fix conventional commit breaking',
    dscr = 'fix conventional commit with breaking change(s)',
  }, {
    text('fix!'),
    nonempty(1, '(', ''),
    insert(1, 'scope'),
    nonempty(1, ')', ''),
    text(': '),
    insert(2, 'title'),
    text({'', '', 'BREAKING CHANGE: '}),
    insert(0),
  }),
}
