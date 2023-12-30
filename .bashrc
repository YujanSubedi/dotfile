#
# ~/.bashrc
#

# ls colors:
# LS_COLORS='di=38;5;37:fi=38;5;10:ex=38;5;160'
LS_COLORS="di=38;5;37:fi=0:ln=38;5;51:pi=38;5;159:so=38;5;220:bd=48;5;33;38;5;27:cd=48;5;33;38;5;27:or=48;5;160:mi=01;38;5;231:ex=38;5;197:*.rpm=38;5;208:*.deb=38;5;208:*.zip=38;5;208:*.tar=38;5;208:*.gz=38;5;208:*.bz2=38;5;208:*.xz=38;5;208:*.tar.gz=38;5;208:*.tar.xz=38;5;208:*.tar.bz2=38;5;208:*.jpg=38;5;135:*.png=38;5;135:*.gif=38;5;135:*.bmp=38;5;135:*.mp3=38;5;160:*.mp4=38;5;160:*.mkv=38;5;160:*.avi=38;5;160:*.ogg=38;5;160:*.wav=38;5;160:"

LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=󱓟:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"


# export the defaults
export LS_COLORS
export LF_ICONS
export EDITOR="nvim"
export VISUAL="nvim"


# history:
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTCONTROL=ignoreboth
# export HISTTIMEFORMAT="%Y-%m-%d %T "

# get vim mode in bash: 
set -o vi

# append history
shopt -s histappend

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Alias:
# alias pacman='pacman --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias rm='rm -i'
alias mv='mv -i'

# alias vi="nvim"
# alias vim="nvim"
alias la="ls -a"
alias tml="tmux ls"
alias tmc="tmux  new -s"
alias tma="tmux attach -t"
alias tmd="tmux kill-ses -t" 


# Keybindings:
# make <C-l> behave as clear x
bind '"\C-l":"\e\C-l A"'
# make <C-w> give exit command
bind '"\C-w":"\e\C-d"'

# other shortcuts
# bind '"\C-e":"source ~/py_env/bin/activate \n"'
bind '"\C-e":"source ~/miniconda3/etc/profile.d/conda.sh; conda activate py_env \n"'
bind '"\C-f":"pacman -Ss "'
bind '"\C-n":"nvim . \n"'
# bind '"\C-b":"fg \n"'


# Function to get the Git branch
parse_git_branch() {
  branch=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [ -n "$branch" ]; then
	  echo -e "\e[38;5;14m 🡪 git:(\e[38;5;35m$(git symbolic-ref --short HEAD 2> /dev/null)\e[38;5;14m)\e[0m"
  fi
}

# Main PS1 for the bashrc: 
PS1=' (\[\e[38;5;2m\]\uϮ\h\[\e[m\]):[\[\e[38;5;214m\]\w\[\e[m\]]$(parse_git_branch)\[\e[m\]\n \[\e[38;5;1m\]✗ \[\e[m\]'
