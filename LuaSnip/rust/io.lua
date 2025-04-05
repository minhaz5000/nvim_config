local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual

local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {
  s(
    { trig = 'eppf', snippetType = 'autosnippet' },
    fmt([[eprint!("{}");]], {
      i(1),
    })
  ),
  s(
    { trig = 'eppn', snippetType = 'autosnippet' },
    fmt([[eprintln!("{}");]], {
      i(1),
    })
  ),
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
  s(
    { trig = 'inp', desc = 'Input from stdin' },
    fmta(
      [[
    let mut <> = String::new();
    std::io::stdin().read_line(&mut <>).expect("Error reading input!");
    let mut <>: <> = <>.trim().parse().expect("Error parsing input!");]],
      { i(1, 'input'), rep(1), rep(1), i(2, 'i32'), rep(1) }
    ),
    { condition = line_begin }
  ),
}
