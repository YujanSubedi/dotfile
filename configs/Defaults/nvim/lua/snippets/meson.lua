-- Meson build language snippets
local ls = require("luasnip")
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

return {
	s(
		"c_default_init",
		fmt(
			[[
project('{}', 'cpp', default_options: ['cpp_std=c++23'])

source_files = files('main.cpp')

include_dir = include_directories('include')

dependencies_list = []

# Create the static library (lib/a)
# static_library(
#   '{}',
#   sources: source_files,
#   include_directories: include_dir,
#   dependencies: dependencies_list,
# )

# Create the shared library (dll/so)
# shared_library(
#   '{}',
#   sources: source_files,
#   include_directories: include_dir,
#   dependencies: dependencies_list,
# )

# Create executable
executable(
  '{}',
  sources: source_files,
  include_directories: include_dir,
  dependencies: dependencies_list,
)
				]],
			{ i(1, "MyProject"), rep(1), rep(1), rep(1) }
		)
	),
}
