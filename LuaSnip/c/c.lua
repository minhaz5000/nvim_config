local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual

local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {
  -- MAIN FUNCTION
  s(
    { trig = 'main', dscr = 'main function boilerplate' },
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
  -- GENRIC FUNCTION
  s(
    { trig = 'ff', snippetType = 'autosnippet' },
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
}
