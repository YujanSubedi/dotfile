-- Rust language snippets
local ls = require("luasnip")
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

return {
	s(
		"c_unittestin",
		fmt(
			[[
#[cfg(test)]
mod tests {{
    use super::*;

    #[test]
    fn test_01() {{
        {}
        assert_eq!(0, 0);
    }}

    #[test]
    fn test_02() {{
        {}
        assert_eq!(0, 0);
    }}

    #[test]
    fn test_03() {{
        {}
        assert_eq!(0, 0);
    }}

    #[test]
    fn test_04() {{
        {}
        assert_eq!(0, 0);
    }}

    #[test]
    fn test_05() {{
        {}
        assert_eq!(0, 0);
    }}
}}
  ]],
			{ i(1, ""), rep(1), rep(1), rep(1), rep(1) }
		)
	),

	s(
		"c_unittestin",
		fmt(
			[[
use {};

#[test]
fn test_01() {{
    assert_eq!(0, 0);
}}

#[test]
fn test_02() {{
}}

#[test]
fn test_03() {{
}}

#[test]
fn test_04() {{
}}

#[test]
fn test_05() {{
}}
  ]],
			i(1, "crate")
		)
	),
}
