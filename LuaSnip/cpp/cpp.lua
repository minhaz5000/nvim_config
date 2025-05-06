local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual

local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {
  -- MAIN FUNCTION
  s(
    { trig = 'main', dscr = 'Boilerplate for c programs' },
    fmta(
      [[
      #include <<iostream>>

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
      /*
      <>
      */
      <>(<>)
      {
          <>
      }
      ]],
      {
        i(3),
        i(1),
        i(2),
        d(4, get_visual),
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
        i(1),
        i(0),
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
  s({ trig = 'scst', desc = 'Static Cast', snippetType = 'autosnippet' }, fmt('static_cast<{}>({})', { i(1, 'typename'), d(2, get_visual) })),
}
