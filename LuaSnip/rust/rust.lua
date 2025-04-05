local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual

local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {
  s({ trig = ';,', snippetType = 'autosnippet', wordTrig = false }, {
    t '=>',
  }),
  s({ trig = ';.', snippetType = 'autosnippet', wordTrig = false }, {
    t '->',
  }),
  s({ trig = 'vv', snippetType = 'autosnippet' }, fmta('{<>}', { i(1) })),
}
