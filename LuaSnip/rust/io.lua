local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual

local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {
  s(
    { trig = 'eppf', snippetType = 'autosnippet' },
    fmt([[eprint!("{}"{});]], {
      i(1),
      i(2),
    })
  ),
  s(
    { trig = 'eppn', snippetType = 'autosnippet' },
    fmt([[eprintln!("{}"{});]], {
      i(1),
      i(2),
    })
  ),
  s(
    { trig = 'ppn', snippetType = 'autosnippet' },
    fmt([[println!("{}"{});]], {
      i(1),
      i(2),
    })
  ),
  s(
    { trig = 'ppf', snippetType = 'autosnippet' },
    fmt([[print!("{}"{});]], {
      i(1),
      i(2),
    })
  ),
  s(
    { trig = 'inp', desc = 'Input from stdin' },
    fmta(
      [[
    let mut <> = String::new();
    std::io::stdin()
      .read_line(&mut <>)
      .expect("Error reading input!");
    let <>: <> = <>.trim().parse().expect("Error parsing input!");]],
      { i(1, 'input'), rep(1), rep(1), i(2, 'i32'), rep(1) }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = 'vinp', desc = 'Read a vector from stdin' },
    fmta(
      [[
      let mut input = String::new();
      std::io::stdin().read_line(&mut input).expect("Failed to read input");
      let <>: Vec<<<>>> = input
        .split_whitespace()
        .map(|s| s.parse().expect("Failed to parse number"))
        .collect();]],
      { i(1, 'nums'), i(2, 'i32') }
    )
  ),
  s(
    { trig = 'pinp', desc = 'Read multiple values from stdin' },
    fmta(
      [[
    let mut input = String::new();
    std::io::stdin().read_line(&mut input).expect("Failed to read input");
    let (<>, <>) = {
      let mut iter = input.split_whitespace();
      (
        iter.next().unwrap().parse().expect("Failed to parse first value"),
        iter.next().unwrap().parse().expect("Failed to parse second value")
      )
    };]],
      { i(1, 'a'), i(2, 'b') }
    )
  ),
  s(
    { trig = 'itridx', desc = 'Iterate with index' },
    fmta(
      [[
    for (i, <>) in <>.iter().enumerate() {
      <>
    }]],
      { i(1, 'item'), i(2, 'vec'), i(3) }
    )
  ),
  s(
    { trig = 'timeit', desc = 'Measure execution time' },
    fmta(
      [[
    let start = std::time::Instant::now();
    <>
    let duration = start.elapsed();
    println!("Time elapsed: {:?}", duration);]],
      { i(1) }
    )
  ),
}
