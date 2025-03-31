# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git 
    zsh-autosuggestions 
    zsh-syntax-highlighting 
    web-search
    virtualenv
)

source $ZSH/oh-my-zsh.sh

# for separating history
unsetopt inc_append_history
unsetopt share_history

export EDITOR='vim'
export VISUAL='vim'

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# for screensharing
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland

bindkey '^ ' autosuggest-accept
bindkey '^o' clear-screen

alias tmux='tmux -u'
alias nautilus='GTK_THEME=Adwaita-dark GDK_BACKEND=x11 nautilus'
alias matplotlib-python3='QT_QPA_PLATFORM=xcb python3'
alias arduinoApp='~/.arduino-application-image/AppRun'
alias matlabApp='wmname compiz && /usr/local/bin/matlab'
alias godotApp='$HOME/.godotAppRun/Godot_v4.3-stable_linux.x86_64'
alias notify-send='canberra-gtk-play -f $HOME/.config/mako/notification-sound.wav && /usr/bin/notify-send'

export PATH="$HOME/nvim-linux64/bin/./:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="$HOME/.alacritty/target/release:$PATH"
# alacritty can be installed using sudo apt in ubuntu 24.04


# ---- Eza (better ls) -----
alias els="/usr/bin/ls"
alias ls="eza --icons=always"
# alias els="eza --icons=always"

# ---- Zoxide (better cd) ----
# for arch
eval "$(zoxide init zsh)"
# alias cd="z"		# better to use cd and z separately


# source /home/neeraj/anaconda3/bin/activate base
# conda deactivate

# Created by `pipx` on 2024-08-07 12:04:55
export PATH="$PATH:/home/neeraj/.local/bin"


# For CUDA
export PATH=/usr/local/cuda-12.6/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.6/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# For Go
export PATH=$PATH:/usr/local/go/bin



source $HOME/.venv/bin/activate

# for networkx directory alone 
if [[ $(pwd) == "$HOME/btp/networkx"* ]]; then
   source "$HOME/btp/networkx/networkx-dev/bin/activate"
fi

if [[ $(pwd) == "$HOME/Desktop/learning/ml/kaggle-titanic"* ]]; then
   source "$HOME/Desktop/learning/ml/kaggle-titanic/.kaggle/bin/activate"
fi

export GUROBI_HOME="/opt/gurobi/linux64"
export PATH="${GUROBI_HOME}/bin:$PATH"
export LD_LIBRARY_PATH="${GUROBI_HOME}/lib:$LD_LIBRARY_PATH"
export GRB_LICENSE_FILE="$HOME/gurobi.lic"

alias gcc-11='gcc'
alias cmake='/home/neeraj/.cmake-4.0.0/bin/cmake'
alias ctest='/home/neeraj/.cmake-4.0.0/bin/ctest'
alias cpack='/home/neeraj/.cmake-4.0.0/bin/cpack'
