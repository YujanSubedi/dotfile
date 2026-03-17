-- C language snippets
local ls = require("luasnip")
-- local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

return {
	s(
		"c_main",
		fmt(
			[[
int main(void){{
  {}
  return 0;
}}
	]],
			i(1, "")
		)
	),
}
