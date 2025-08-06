local helpers = require 'personal.luasnip-helper-funcs'
local get_date = helpers.get_ISO_8601_date
local get_visual = helpers.get_visual

-- A logical OR of `line_begin` and the regTrig '[^%a]trig'
function line_begin_or_non_letter(line_to_cursor, matched_trigger)
  local line_begin = line_to_cursor:sub(1, -(#matched_trigger + 1)):match '^%s*$'
  local non_letter = line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match '[ :`=%{%(%["]'
  return line_begin or non_letter
end

return {
  -- Today's date in YYYY-MM-DD (ISO 8601) format
  s(
    { trig = 'today', dscr = "Get today's date in YYYY-MM-DD (ISO 8601) format" },
    { f(get_date) }
    -- {f(get_ISO_8601_date)}
  ),
  s({ trig = 'sign', dscr = 'My sign' }, { t { 'Yours Sincerely,', '', 'S. M. Minhazul Haque' } }, { condition = line_begin }),
  -- Date Modified snippet
  -- s({ trig = 'modifydate', dscr = 'Date Modified (Today)', condition = line_begin_or_non_letter }, fmt('Date Modified: {}', { f(get_date) })),
  -- s({ trig = 'createdate', dscr = 'Date Created (Today)', condition = line_begin_or_non_letter }, fmt('Date Created: {}', { f(get_date) })),
}
