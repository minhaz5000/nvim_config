local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual

local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {
  -- MAIN FUNCTION
  s(
    { trig = 'main', dscr = 'Boilerplate for c programs' },
    fmta(
      [[
      int main()
      {
          <>
          return 0;
      }
      ]],
      { i(1) }
    ),
    { condition = line_begin }
  ),
  -- genric function
  s(
    { trig = 'ff', snippettype = 'autosnippet' },
    fmta(
      [[
      <>(<>)
      {
          <>
      }
      ]],
      {
        i(1, 'return_type function_name'),
        i(2, 'params'),
        d(3, get_visual),
      }
    ),
    { condition = line_begin }
  ),
  -- DATA STRUCTURE
  s(
    { trig = 'ss', snippetType = 'autosnippet' },
    fmta(
      [[
      struct <> {
          <>
      };
      ]],
      {
        i(1, 'StructName'),
        i(2),
      }
    )
  ),
  -- -> DEREFERENCE STRUCTURE PROPERTY
  s({ trig = ';.', snippetType = 'autosnippet', wordTrig = false }, {
    t '->',
  }),
  -- RETURN
  s({ trig = ';r', snippetType = 'autosnippet', wordTrig = false }, {
    t 'return',
  }, { condition = line_begin }),
  -- Static cast
  s({ trig = 'scast', desc = 'Static Cast', snippetType = 'autosnippet' }, fmt('static_cast<{}>({})', { i(1, 'typename'), d(2, get_visual) })),
}
