local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual

local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {
  -- PRINTF
  s(
    { trig = 'ppf', snippetType = 'autosnippet' },
    fmta([[printf("<>");]], {
      i(1),
    }),
    { condition = line_begin }
  ),
  -- PUTS
  s(
    { trig = 'pps', snippetType = 'autosnippet' },
    fmta([[puts("<>");]], {
      i(1),
    }),
    { condition = line_begin }
  ),
  -- Scanf
  s(
    { trig = 'scc', snippetType = 'autosnippet' },
    fmta([[scanf("<>");]], {
      i(1),
    }),
    { condition = line_begin }
  ),
}
