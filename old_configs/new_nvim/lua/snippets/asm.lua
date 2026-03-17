-- Asm language snippets
local ls = require("luasnip")
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

return {
	s(
		"c_start_intel_x86",
		fmt([[
.global _start
.intel_syntax noprefix

_start:
	{}
	mov rax, 60
	mov rdi, 0
				]], i(1, ""))
	),

	s(
		"c_module_intel",
		fmt([[
.global {}
.intel_syntax noprefix

{}:
	mov rax, 60
	mov rdi, 0
				]], {i(1, "_start"), rep(1)})
	),

	s(
		"c_start_riscv",
		fmt([[
.global _start
.intel_syntax noprefix

_start:
	{}
	li a7, 93
	li a0, 0
	ecall
				]], i(1, ""))
	),
}
