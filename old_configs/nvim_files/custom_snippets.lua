-- Custom Code snippet:
local ls = require("luasnip")
local rep = require("luasnip.extras").rep
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- c snippet
	c = {
		s("c_main", {
			t({ "#include<stdio.h>", "", "int main(void){", "  " }),
			i(1, ""),
			t({ "", "  return 0;", "}" }),
		}),
	},

	-- cpp snippet
	cpp = {
		s("c_main", {
			t({ "#include<iostream>", "using std::cout;", "using std::cin;", "", "int main(void){", "  " }),
			i(1, ""),
			t({ "", "  return 0;", "}" }),
		}),
		s("c_mainvector", {
			t({ "#include<iostream>", "#include<vector>", "using std::cin;", "" }),
			t({ "using std::cout;", "using std::vector;", "", "int main(void){", "  " }),
			i(1, ""),
			t({ "", "  return 0;", "}" }),
		}),
		s("c_mainhashmap", {
			t({ "#include<iostream>", "#include<unordered_map>", "using std::cin;", "" }),
			t({ "using std::cout;", "using std::unordered_map;", "", "int main(void){", "  " }),
			i(1, ""),
			t({ "", "  return 0;", "}" }),
		}),
		s("c_mainunorderedset", {
			t({ "#include<iostream>", "#include<unordered_set>", "using std::cin;", "" }),
			t({ "using std::cout;", "using std::unordered_set;", "", "int main(void){", "  " }),
			i(1, ""),
			t({ "", "  return 0;", "}" }),
		}),
	},

	-- verilog snippet
	verilog = {
		s("c_testbench", {
			t({ "`timescale 1ns / 1ps", "", "module " }),
			i(1, "test_module"),
			t({ ";", "", "  initial begin", '    $dumpfile("waveform_' }),
			rep(1),
			t({ '.vcd");', "    $dumpvars(0, " }),
			rep(1),
			t({ ");", "  end", "", "endmodule" }),
		}),
	},

	-- systemverilog snippet
	systemverilog = {
		s("c_testbench", {
			t({ "`timescale 1ns / 1ps", "", "module " }),
			i(1, "test_module"),
			t({ ";", "", "  initial begin", '    $dumpfile("waveform_' }),
			rep(1),
			t({ '.vcd");', "    $dumpvars(0, " }),
			rep(1),
			t({ ");", "  end", "", "endmodule" }),
		}),
	},
}
