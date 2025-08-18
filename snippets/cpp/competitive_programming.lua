local helpers = require 'personal.luasnip-helper-funcs'
local get_visual = helpers.get_visual

local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {
  -- Boilerplate
  s(
    { trig = 'main', dscr = 'Boilerplate code for competitive programming' },
    fmta(
      [[
      #include <<bits/stdc++.h>>
      using namespace std;

      int main()
      {
          <>
          return 0;
      }
      ]],
      { i(1) }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = 'cp', dscr = 'Boilerplate code for competitive programming' },
    fmta(
      [[
      #include <<bits/stdc++.h>>

      using namespace std;
      typedef long long ll;
      typedef vector<<int>> vi;
      typedef pair<<int,int>> pi;

      #define F first
      #define S second
      #define PB push_back
      #define MP make_pair
      #define REP(i,a,b) for (int i = a; i <<= b; i++)


      int main()
      {
          ios::sync_with_stdio(0);
          cin.tie(0);
          <>
          return 0;
      }
      ]],
      { i(1) }
    ),
    { condition = line_begin }
  ),
}
