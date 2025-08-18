local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual
local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {
  -- Standard Rust doc comment
  s(
    { trig = '///doc', snippetType = 'autosnippet', desc = 'Rust function doc' },
    fmta(
      [[
        /// <>
        ///
        /// # Arguments
        ///
        /// * <> - <>
        ///
        /// # Returns
        /// <>
        ///
        /// # Examples
        /// ```rust
        /// <>
        /// ```
    ]],
      { i(1, 'Description.'), i(2, 'argument_name'), i(3, 'type and description.'), i(4, 'type and description of returned object'), i(5, 'write me later') }
    ),
    { condition = line_begin }
  ),

  -- Crate-level doc
  s(
    { trig = '///crate', snippetType = 'autosnippet', desc = 'Crate-level doc' },
    fmta(
      [[
        //! <>
        //!
        //! # Examples
        //! ```rust
        //! <>
        //! ```
    ]],
      { i(1, 'Description.'), i(2, 'write me later') }
    ),
    { condition = line_begin }
  ),

  -- Test doc snippet
  s(
    { trig = '///test', snippetType = 'autosnippet', desc = 'Test function doc' },
    fmta(
      [[
        /// <>
        ///
        /// # Examples
        /// ```rust
        /// <>
        /// ```
    ]],
      { i(1, 'Description.'), i(2, 'write me later') }
    ),
    { condition = line_begin }
  ),
}
