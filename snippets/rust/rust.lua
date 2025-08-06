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

  s(
    { trig = 'ffn', snippetType = 'autosnippet', desc = 'Function with return_type' },
    fmta(
      [[
    fn <>(<>) ->> <> {
        <>
    }
    ]],
      { i(1, 'function_name'), i(2, 'parameter: type'), i(3, 'return_type'), i(4, 'function_body') }
    ),
    { condition = line_begin }
  ),

  s(
    { trig = 'ffv', snippetType = 'autosnippet', desc = 'Function without return type' },
    fmta(
      [[
    fn <>(<>) {
        <>
    }
    ]],
      { i(1, 'function_name'), i(2, 'parameter: type'), i(3, 'function_body') }
    ),
    { condition = line_begin }
  ),
}
