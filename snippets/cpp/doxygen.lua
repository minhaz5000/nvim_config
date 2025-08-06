local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual

local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {

  -- Doxygen comment block
  s(
    { trig = 'd//', snippetType = 'autosnippet', desc = 'Doxygen block' },
    fmt(
      [[
      /**
       * {}
       */
    ]],
      {
        i(1, 'Description...'),
      }
    ),
    { condition = line_begin }
  ),

  -- @brief tag
  s(
    { trig = ';b', snippetType = 'autosnippet', desc = 'Insert @brief' },
    fmt([[@brief {}]], {
      i(1, 'Short description...'),
    }),
    { condition = line_begin }
  ),

  -- @param tag
  s(
    { trig = ';p', snippetType = 'autosnippet', desc = 'Insert @param' },
    fmt([[@param {} {}]], {
      i(1, 'paramName'),
      i(2, 'description'),
    }),
    { condition = line_begin }
  ),

  -- @return tag
  s(
    { trig = ';r', snippetType = 'autosnippet', desc = 'Insert @return' },
    fmt([[@return {}]], {
      i(1, 'description'),
    }),
    { condition = line_begin }
  ),

  -- Function documentation
  s(
    { trig = 'd/f', snippetType = 'autosnippet', desc = 'Function Doxygen' },
    fmt(
      [[
      /**
       * @brief {}
       * 
       * @param {} {}
       * @return {}
       */
    ]],
      {
        i(1, 'Function description...'),
        i(2, 'paramName'),
        i(3, 'Param description...'),
        i(4, 'Return description...'),
      }
    ),
    { condition = line_begin }
  ),

  -- Class documentation
  s(
    { trig = 'd/cl', snippetType = 'autosnippet', desc = 'Class Doxygen' },
    fmt(
      [[
      /**
       * @class {}
       * @brief {}
       */
    ]],
      {
        i(1, 'ClassName'),
        i(2, 'Description...'),
      }
    ),
    { condition = line_begin }
  ),

  -- File header
  s(
    { trig = 'dfile', snippetType = 'autosnippet', desc = 'File doc block' },
    fmt(
      [[
      /**
       * @file {}
       * @brief {}
       * @author {}
       * @date {}
       */
    ]],
      {
        i(1, 'filename.hpp'),
        i(2, 'Short description...'),
        i(3, 'Your Name'),
        i(4, os.date '%Y-%m-%d'),
      }
    ),
    { condition = line_begin }
  ),
}
