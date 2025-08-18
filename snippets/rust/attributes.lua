local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual
local line_begin = require('luasnip.extras.expand_conditions').line_begin

-- It goes like this:
-- d -> directive
-- g -> (optional) global
-- the directive here like a -> allow, w->warn, der->derive, deb->debug, i -> igonre, t->test
-- n -> new (...) node where we write we write

return {
  s(
    { trig = 'dade', snippetType = 'autosnippet', desc = 'Allow dead code (item_level) #[allow(dead_code)]' },
    t '#[allow(dead_code)]',
    { condition = line_begin }
  ),
  s(
    { trig = 'dgade', snippetType = 'autosnippet', desc = 'Allow dead code (crate_level) #![allow(dead_code)]' },
    t '#![allow(dead_code)]',
    { condition = line_begin }
  ),
  s({ trig = 'dgan', snippetType = 'autosnippet', desc = '#![allow(...)] (Crate/Module Level)' }, fmt([=[#![allow({})]]=], i(1)), { condition = line_begin }),
  s({ trig = 'dan', desc = '#[allow(...)] (Item Level)' }, fmt([=[#[allow({})]]=], i(1)), { condition = line_begin }),
  s({ trig = 'dwn', snippetType = 'autosnippet', desc = '#[warn(...)] (Item Level)' }, fmt([=[#[warn({})]]=], i(1)), { condition = line_begin }),
  s({ trig = 'dgwn', snippetType = 'autosnippet', desc = '#![warn(...)] (Crate/Module Level)' }, fmt([=[#![warn({})]]=], i(1)), { condition = line_begin }),
  s({ trig = 'ddenn', snippetType = 'autosnippet', desc = '#[deny(...)] (Item Level)' }, fmt([=[#[deny({})]]=], i(1)), { condition = line_begin }),
  s({ trig = 'dgden', snippetType = 'autosnippet', desc = '#![deny(...)] (Crate/Module Level)' }, fmt([=[#![deny({})]]=], i(1)), { condition = line_begin }),
  s({ trig = 'ddn', snippetType = 'autosnippet', desc = '#[derive(..)]' }, fmt([=[#[derive({})]]=], i(1)), { condition = line_begin }),
  s({ trig = 'dddeb', snippetType = 'autosnippet', desc = '#[derive(Debug)]' }, t '#[derive(Debug)', { condition = line_begin }),
  s({ trig = 'ddcd', snippetType = 'autosnippet', desc = '#[derive(Debug, Clone)]' }, t '#[derive(Debug, Clone)', { condition = line_begin }),
  s({ trig = 'dte', snippetType = 'autosnippet', desc = '#[test]' }, t '#[test]', { condition = line_begin }),
  s({ trig = 'dig', snippetType = 'autosnippet', desc = '#[ignore]' }, t '#[ignore]', { condition = line_begin }),
  s({ trig = 'dnn', desc = '#[..]' }, fmt([=[#[{}]]=], { i(1, '..') }), { condition = line_begin }),
  s({ trig = 'dgn', desc = '#![..]' }, fmt([=[#![{}]]=], { i(1, '..') }), { condition = line_begin }),
}
