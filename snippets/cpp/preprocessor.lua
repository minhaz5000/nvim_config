local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual

local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {
  -- ifdef
  s(
    { trig = 'ifdef', snippetType = 'autosnippet' },
    fmta(
      [[
      #ifdef <>
          <>
      #endif
      ]],
      {
        i(1),
        d(2, get_visual),
      }
    ),
    { condition = line_begin }
  ),
  -- ifndef
  s(
    { trig = 'ifndef', snippetType = 'autosnippet' },
    fmta(
      [[
      #ifndef <>
          <>
      #endif
      ]],
      {
        i(1),
        d(2, get_visual),
      }
    ),
    { condition = line_begin }
  ),
  -- Header Guard
  s(
    { trig = 'header_guard', desc = 'INCLUDE GUARD' },
    fmta(
      [[
      #ifndef <>
      #define <>
          <>
      #endif
      ]],
      {
        i(1),
        rep(1),
        d(2, get_visual),
      }
    ),
    { condition = line_begin }
  ),
  -- define
  s(
    { trig = 'dff', snippetType = 'autosnippet' },
    fmta(
      [[
      #define <>
      ]],
      {
        i(1),
      }
    ),
    { condition = line_begin }
  ),
}
