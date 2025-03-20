local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual

local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {
  -- PRINTF
  s(
    { trig = 'ppn', snippetType = 'autosnippet' },
    fmt([[println!("{}");]], {
      i(1),
    })
  ),
  s(
    { trig = 'ppf', snippetType = 'autosnippet' },
    fmt([[print!("{}");]], {
      i(1),
    })
  ),
}
