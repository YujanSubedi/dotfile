-- Status Line

-- Display only one statusline
vim.opt.laststatus = 3

-- Show partial command in statusline.
vim.opt.showcmd = true
vim.opt.showcmdloc = "statusline"

vim.cmd('highlight StatusLineNormal guifg=#1a1c23 guibg=#e45e7c gui=bold')
vim.cmd('highlight StatusLineInsert guifg=#1a1c23 guibg=#25b2bc gui=bold')
vim.cmd('highlight StatusLineVisual guifg=#1a1c23 guibg=#d67229 gui=bold')
vim.cmd('highlight StatusLineCommand guifg=#1a1c23 guibg=#09a780 gui=bold')
vim.cmd('highlight StatusLineDefault guifg=#1a1c23 guibg=#282a36 gui=bold')
vim.cmd('highlight StatusLineGit guifg=#09a780 guibg=#2e303e gui=bold')
vim.cmd('highlight StatusLineFiletype guifg=#008fb3 guibg=#2e303e gui=bold')
vim.cmd('highlight StatusLineOthers guifg=#7c7e93 guibg=#282828 gui=bold')
vim.cmd('highlight StatusLineMacro guifg=#e34a27 guibg=#151515 gui=bold')
vim.cmd('highlight StatusLineExtra guifg=#a5a2a2 guibg=#151515 gui=bold')

local Mode_hasmap = {
  n = { name = ' NORMAL ', highlighter = '%#StatusLineNormal#' },
  v = { name = ' VISUAL ', highlighter = '%#StatusLineVisual#' },
  V = { name = ' V-LINE ', highlighter = '%#StatusLineVisual#' },
  i = { name = ' INSERT ', highlighter = '%#StatusLineInsert#' },
  r = { name = ' PROMPT ', highlighter = '%#StatusLineInsert#' },
  R = { name = ' REPLACE ', highlighter = '%#StatusLineInsert#' },
  c = { name = ' COMMAND ', highlighter = '%#StatusLineCommand#' },
  s = { name = ' SELECT ', highlighter = '%#StatusLineDefault#' },
  S = { name = ' S-LINE ', highlighter = '%#StatusLineDefault#' },
  t = { name = ' TERMINAL ', highlighter = '%#StatusLineDefault#' },
  ['\22'] = { name = ' V-Block ', highlighter = '%#StatusLineVisual#' },
}

local function get_Mode_details()
  local nvim_mode = vim.fn.mode()
  return Mode_hasmap[nvim_mode] or { name = ' Unknown ', highlighter = '%#StatusLineDefault#' }
end

local function get_git_branch()
  return vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr '\n' ' '")
end

function Statusline_value()
  local mode_details = get_Mode_details()
  local branch = get_git_branch()
  local macro_recording = vim.fn.reg_recording()
  return mode_details.highlighter .. mode_details.name .. "%#StatusLineGit# " .. branch .. "%#StatusLineOthers# %f %#StatusLineMacro# " .. macro_recording .. "%#StatusLineExtra# %m %= %S (%{&encoding}) %#StatusLineOthers# %p%% %#StatusLineFiletype# %y " .. mode_details.highlighter .. " %l:%c "
end

-- Set the statusline with colors
vim.o.statusline = '%{%v:lua.Statusline_value()%}'
