#!/bin/zsh

# ~/.zshrc

# Main Prompt for Zsh
# Function to get the Git branch
function parse_git_branch() {
  local git_branch
  local git_status
  git_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -n $(git status --short 2>/dev/null) ]] && git_status="*" || git_status=""
  if [[ -n "$git_branch" ]]; then
    echo -n "%F{14}🡪 git:(%F{35}$git_branch%F{1}$git_status%F{14})%f"
  fi
}

PROMPT=' (%F{2}%nϮ%m%f):[%F{214}%~%f] $(parse_git_branch)
%(?.%F{1}.%F{243}) ✗ %f'

# Aliases:
alias history="history 0"
source ~/.config/shell/alias/init_alias

# help command
autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

# # Keybindings in Zsh:
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey -s '^E' 'source ~/miniconda3/etc/profile.d/conda.sh; conda activate base\n'
bindkey -s '^F' 'pacman -Ss '
bindkey -s '^[f' 'pacman -F '
bindkey -s '^N' 'nvim .\n'
bindkey -s '^[n' 'ncd\n'
bindkey -s '^[`' 'footclient &\n'

# Set vi mode in Zsh:
bindkey -v

setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
setopt PROMPT_SUBST
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it

# completion
# enable completion features
autoload -Uz compinit && compinit -d ~/.cache/zcompdump
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# Syntax highlighting
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
