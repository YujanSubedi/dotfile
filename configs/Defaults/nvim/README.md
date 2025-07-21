# Neovim config

## Lsp, Dap, Linter and Formatter

| Language | Language Server Protocol | Debug Adapter Protocol | Linter       | Formatter       |
| -------- | ------------------------ | ---------------------- | ------------ | --------------- |
| assembly |                          |                        |              | asmfmt          |
| c/c++    | clangd                   | codelldb               |              |                 |
| rust     | rust_analyzer            | codelldb               |              |                 |
| zig      | zls                      | codelldb               |              |                 |
| shell    |                          | bash-debug-adapter     | shellcheck   | beautysh, shfmt |
| lua      | lua_ls                   |                        |              | stylua          |
| makefile | checkmake                |                        |              |                 |
| python   | pyright                  | debugpy                | ruff         | yapf            |
| verilog  | verible                  |                        |              |                 |
| nix      | rnix                     |                        |              | nixpkgs-fmt     |
| docker   | dockerls                 |                        |              |                 |
| latex    | texlab                   |                        |              |                 |
| markdown |                          |                        | markdownlint | prettier        |
| golang   | gopls                    | delve                  |              |                 |
| odin     | ols                      |                        |              |                 |
| dart     | flutter-tools            |                        |              |                 |
| json     |                          |                        | jsonlint     | prettier        |
| html     |                          |                        | htmlhint     | prettier        |
| css      | cssls                    |                        |              | prettier        |
| js/ts    | ts_ls, denols            |                        |              | prettier        |

## Extra plugins that are may be useful

- Harpon For saving buffer state

```lua
{
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    branch = "harpoon2",
    config = function()
        local harpoon = require("harpoon") harpoon:setup() vim.keymap.set("n", "<A-a>", function() harpoon:list():add() end, { desc = "Add to Harpoon buffers" })
        vim.keymap.set("n", "<A-0>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Show all Harpoon buffers" })
        vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end, { desc = "Goto Harpoon buffer 1" })
        vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end, { desc = "Goto Harpoon buffer 2" })
        vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end, { desc = "Goto Harpoon buffer 3" })
        vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end, { desc = "Goto Harpoon buffer 4" })
        vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end, { desc = "Goto Harpoon buffer 5" })
        vim.keymap.set("n", "<A-6>", function() harpoon:list():select(6) end, { desc = "Goto Harpoon buffer 6" })
        vim.keymap.set("n", "<A-7>", function() harpoon:list():select(7) end, { desc = "Goto Harpoon buffer 7" })
        vim.keymap.set("n", "<A-8>", function() harpoon:list():select(8) end, { desc = "Goto Harpoon buffer 8" })
        vim.keymap.set("n", "<A-9>", function() harpoon:list():select(9) end, { desc = "Goto Harpoon buffer 9" })
    end,
},
```

## ColorSchemes

- Rose-pine

```lua
{
    "rose-pine/neovim", name = "rose-pine",
    -- opts = { styles = { transparency = true } },
    init = function() vim.cmd("colorscheme rose-pine") end,
},
```

- Tokyonight

```lua
{
    "folke/tokyonight.nvim",
    -- opts = { transparent = true },
    init = function() vim.cmd.colorscheme("tokyonight") end,
},
```

- Onedark

```lua
{
    "olimorris/onedarkpro.nvim",
    -- opts = { options = { transparency = true } },
    init = function() vim.cmd.colorscheme("onedark") end,
},
```

- Monokai

```lua
{
    "loctvl842/monokai-pro.nvim",
    -- opts = { transparent_background = true },
    init = function() vim.cmd.colorscheme("monokai") end,
},
```

- Dracula

```lua
{
    "Mofiqul/dracula.nvim",
    -- opts = { transparent_bg = true },
    init = function() vim.cmd.colorscheme("dracula") end,
},
```

- Catppuccin

```lua
{
    "catppuccin/nvim", name = "catppuccin",
    -- opts = { transparent_background = true },
    init = function() vim.cmd.colorscheme("catppuccin") end,
},
```

- Nightfox

```lua
{
    "EdenEast/nightfox.nvim",
    -- opts = { options = { transparent = true } },
    init = function() vim.cmd.colorscheme("nightfox") end,
},
```

- Night-owl

```lua
{
    "oxfist/night-owl.nvim",
    -- opts = { transparent_background = true },
    init = function() vim.cmd.colorscheme("night-owl") end,
},
```
