-- C language snippets
local ls = require("luasnip")
-- local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

return {
	s(
		"c_default_init",
		fmt(
			[[
# Set Cmake Version
cmake_minimum_required(VERSION 4.2)

# Project name
project({} CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 23)

# Create compile_commands.json for clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Set Output Directories
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${{CMAKE_SOURCE_DIR}}/target/)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${{CMAKE_SOURCE_DIR}}/target/)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${{CMAKE_SOURCE_DIR}}/target/)

# Debug Directories
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${{CMAKE_SOURCE_DIR}}/target/Debug/)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${{CMAKE_SOURCE_DIR}}/target/Debug/)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${{CMAKE_SOURCE_DIR}}/target/Debug/)

# Release Directories
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${{CMAKE_SOURCE_DIR}}/target/Release/)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${{CMAKE_SOURCE_DIR}}/target/Release/)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${{CMAKE_SOURCE_DIR}}/target/Release/)

# Set Cmake Build type
# set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "" FORCE)
set(CMAKE_BUILD_TYPE "Release" CACHE STRING "" FORCE)

# Add Cmake SubDrictory
# add_subdirectory(SubProject)

# Create the static library (lib/a)
# add_library(${{PROJECT_NAME}} STATIC ${{CMAKE_CURRENT_SOURCE_DIR}}/main.cpp)

# Create the shared library (dll/so)
# add_library(${{PROJECT_NAME}} SHARED ${{CMAKE_CURRENT_SOURCE_DIR}}/main.cpp)

# Create executable
add_executable(${{PROJECT_NAME}} ${{CMAKE_CURRENT_SOURCE_DIR}}/main.cpp)

# Source Include Files
target_include_directories(
    ${{PROJECT_NAME}}
    PRIVATE ${{CMAKE_CURRENT_SOURCE_DIR}}/include/
)

# Additional Compiler commands
target_compile_options(
    ${{PROJECT_NAME}}
    PRIVATE
        -Wall # Enables common warnings
        -Wextra # Enables extra warnings
        -Wpedantic # Enforces strict ISO C++ compliance
        -Werror # Treats warnings as error
)
# -O3 # Sets Optimizatin level - Given by Release build
# -g # Adds Debug informations - Given by Debug build

# Add imported static libs
# add_library(importedlibs STATIC IMPORTED)
#
# set_target_properties(
#     importedlibs
#     PROPERTIES IMPORTED_LOCATION ${{CMAKE_CURRENT_SOURCE_DIR}}/include/libunittest.a
# )

# Link linkers
# target_link_libraries(${{PROJECT_NAME}} PRIVATE)

# linker flags
# target_link_options(${{PROJECT_NAME}} PRIVATE)
	]],
			i(1, "MyProject")
		)
	),
}
