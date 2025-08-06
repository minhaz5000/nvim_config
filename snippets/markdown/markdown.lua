local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual

local line_begin = require('luasnip.extras.expand_conditions').line_begin

-- Return snippet tables
return {
  -- TODO NOTE
  s({ trig = 'TODOO', snippetType = 'autosnippet' }, {
    t '**TODO:** ',
  }),
  -- LINK; CAPTURE TEXT IN VISUAL
  s(
    { trig = 'LL', wordTrig = true, snippetType = 'autosnippet' },
    fmta([[[<>](<>)]], {
      d(1, get_visual),
      i(2),
    })
  ),
  -- LINK; CAPTURE URL IN VISUAL
  s(
    { trig = 'LU', wordTrig = true, snippetType = 'autosnippet' },
    fmta([[[<>](<>)]], {
      i(1),
      d(2, get_visual),
    })
  ),
  -- BOLDFACE TEXT
  s(
    { trig = 'tbb', snippetType = 'autosnippet' },
    fmta([[**<>**]], {
      d(1, get_visual),
    })
  ),
  -- ITALIC TEXT
  s(
    { trig = 'tii', snippetType = 'autosnippet' },
    fmta([[*<>*]], {
      d(1, get_visual),
    })
  ),
  -- UNDERLINED TEXT
  s(
    { trig = 'tuu', snippetType = 'autosnippet' },
    fmt([[<u>{}</u>]], {
      d(1, get_visual),
    })
  ),
  -- Hack to remove indentation in bulleted lists
  s({ trig = '  --', snippetType = 'autosnippet' }, { t '- ' }, { condition = line_begin }),

  -- STRIKETHROUGH
  s(
    { trig = 'sstr', snippetType = 'autosnippet' },
    fmta([[~~<>~~]], {
      d(1, get_visual),
    })
  ),

  -- INLINE CODE
  s(
    { trig = 'cc', snippetType = 'autosnippet' },
    fmta([[`<>`]], {
      d(1, get_visual),
    })
  ),
  -- CODE BLOCK (with language)
  s(
    { trig = 'cbb', snippetType = 'autosnippet' },
    fmta(
      [[
    ```<>
    <>
    ```
    ]],
      {
        i(1, 'language'),
        d(2, get_visual),
      }
    ),
    { condition = line_begin }
  ),

  -- BLOCKQUOTE
  s(
    { trig = 'bq', snippetType = 'autosnippet' },
    fmt([[> {}]], {
      d(1, get_visual),
    })
  ),

  -- HORIZONTAL RULE
  s({ trig = 'hr', snippetType = 'autosnippet' }, t '---', { condition = line_begin }),

  -- HTML IMAGE TAG
  s(
    { trig = 'imgg', wordTrig = true, snippetType = 'autosnippet' },
    fmt([[<img src="{}" alt="{}" width="{}">]], {
      i(1, 'url'),
      i(2, 'alt text'),
      i(3, '400'),
    }),
    { condition = line_begin }
  ),

  -- HTML SUPERSCRIPT
  s(
    { trig = ';^', snippetType = 'autosnippet' },
    fmt([[<sup>{}</sup>]], {
      d(1, get_visual),
    })
  ),

  -- HTML SUBSCRIPT
  s(
    { trig = ';_', snippetType = 'autosnippet' },
    fmt([[<sub>{}</sub>]], {
      d(1, get_visual),
    })
  ),

  s({ trig = 'h1', snippetType = 'autosnippet' }, t '# ', { condition = line_begin }),
  s({ trig = 'h2', snippetType = 'autosnippet' }, t '## ', { condition = line_begin }),
  s({ trig = 'h3', snippetType = 'autosnippet' }, t '### ', { condition = line_begin }),

  s(
    { trig = 'itemize', snippetType = 'autosnippet' },
    fmta(
      [[
  | <> | <> |
  | --- | --- |
  | <> | <> |
  ]],
      {
        i(1, 'Column1'),
        i(2, 'Column2'),
        i(3, 'Value1'),
        i(4, 'Value2'),
      }
    ),
    {
      condition = line_begin,
    }
  ),

  s({ trig = 'ghis', snippetType = 'autosnippet' }, fmta([[#<>]], { i(1, 'issue-number') })),
  s({ trig = 'ghpr', snippetType = 'autosnippet' }, fmta([[!<>]], { i(1, 'pr-number') })),

  s(
    { trig = 'det', snippetType = 'autosnippet' },
    fmt(
      [[
  <details>
  <summary>{}</summary>

  {}

  </details>
  ]],
      {
        i(1, 'Click to expand'),
        i(2, 'Details go here...'),
      }
    ),
    { condition = line_begin }
  ),
}
