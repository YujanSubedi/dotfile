-- gitignore language snippets
local ls = require("luasnip")
-- local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

return {
	s(
		"c_cpp_project",
		fmt(
			[[
.cache/
build/
build_x86/
build_x64/
target/
subprojects/*
subprojects/!*.wrap
{}
	]],
			i(1, "")
		)
	),
}
