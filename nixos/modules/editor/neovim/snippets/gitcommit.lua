local ls = require('luasnip')
local s = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local choice = ls.choice_node

return {
  s({
    trig = 'cc',
    name = 'conventional commit',
    dscr = 'Conventional commit',
  }, {
    choice(1, {
      text('feat'), text('fix'), text('doc'), text('chore'),
    }),
    text('('),
    insert(2, 'scope'),
    text('):'),
    insert(3, 'title'),
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
    text('('),
    insert(2, 'scope'),
    text('):'),
    insert(3, 'title'),
    text({'', '', 'BREAKING CHANGE: '}),
    insert(0),
  }),

  s({
    trig = 'feat!',
    name = 'feat conventional commit breaking',
    dscr = 'feat conventional commit with breaking change(s)',
  }, {
    text('feat!('),
    insert(1, 'scope'),
    text('): '),
    insert(2, 'title'),
    text({'', '', 'BREAKING CHANGE: '}),
    insert(0),
  }),

  s({
    trig = 'fix!',
    name = 'fix conventional commit breaking',
    dscr = 'fix conventional commit with breaking change(s)',
  }, {
    text('fix!('),
    insert(1, 'scope'),
    text('): '),
    insert(2, 'title'),
    text({'', '', 'BREAKING CHANGE: '}),
    insert(0),
  }),
}
