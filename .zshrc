# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="" # set by `omz`

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
plugins=(git brew zsh-autosuggestions zsh-syntax-highlighting oc kubectl helm virtualenv themes kubectx multipass kind iterm2) 


source $ZSH/oh-my-zsh.sh

# User configuration
alias vpn-bmelab='sshuttle -r borisassogba@ocp.bme.lab 192.168.111.0/24 --disable-ipv6'
alias k='/usr/local/bin/kubectl'
alias my-public-ip='curl http://ipecho.net/plain; echo'
alias c='clear -x'
alias lkm-lab='ssh lkd@lkd -A '
alias ls='ls --color=auto'
alias ll='ls --sort oldest -lh'
alias nv='$(which nvim)'
alias s='kitten ssh -A borisassogba@ocp.bme.lab'
alias ocp-virt-adlere-lab='kitten ssh -A borisassogba@10.170.116.100'
alias ocp-virt-adlere-lb1='kitten ssh -A borisassogba@10.170.116.101'
alias ocp-virt-adlere-lb2='kitten ssh -A borisassogba@10.170.116.102'
alias hetzner-rhel-img='kitten ssh -A root@10.170.116.190'
alias nv='nvim'
alias vim='nvim'
alias edit-zshrc='vim ~/.zshrc'
alias nvim-config='cd ~/.config/nvim && nvim'
alias wz='nvim ~/.config/wezterm/wezterm.lua'

# Python related things 
alias poetry='/Users/borisassogba/python-world/venvs/poetry/bin/poetry'

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
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PATH Environment Variable
export PATH=/opt/homebrew/bin:/opt/local/libexec/gnubin/:/usr/local/bin:/opt/homebrew/Cellar/helm/3.8.2/bin:/opt/homebrew/Cellar/terraform-provider-libvirt/0.6.14/bin:/opt/homebrew/Cellar/terraform/1.1.8/bin:/opt/homebrew/Cellar/ansible/5.6.0/bin/:/opt/homebrew/Cellar/sshuttle/1.1.0/bin:/Users/borisassogba/go:/Users/borisassogba/go/bin:/opt/homebrew/opt/go/libexec/bin:/opt/homebrew/opt/python@3.13/Frameworks/Python.framework/Versions/3.13/bin:/Users/borisassogba/binaries/bento4/bin:/Users/borisassogba/binaries:$HOME/.local/bin:$HOME/.local/bin/tree-sitter-cli/:$PATH

KIND_EXPERIMENTAL_PROVIDER=podman

# User Functions
function acp() {
  git add .
  git commit -m "$1"
  git push
}

function dev-scripts-ocp {
  echo "Enter your username"
  read -r user
  echo "Enter your password"
  read -s password
  echo " "
  
  echo "Retrieving ***** BME LAB Cluster ***** token login\n"
  echo " "
  TOKEN=$(curl -u $user:$password -kI 'https://oauth-openshift.apps.bme.test.metalkube.org/oauth/authorize?client_id=openshift-challenging-client&response_type=token' | perl -nle'print $& while m{access_token=\K[^&]*}g')
  echo "Attempting to log in to BME LAB Console\n"
  
  oc login --token=${TOKEN} --server=https://api.bme.test.metalkube.org
  
  if [[ $? -eq 0 ]]; then
    echo " "
    echo "👍 Successfully logged in to ***** BME LAB Cluster *****"
  else
    echo " "
    echo "⛔ Please provide the right credentials"
  fi
}


function update {
  echo "start updating ..."

  echo "updating homebrew"
  brew update
  brew upgrade 
  brew cleanup 

  echo "updating oh-my-zsh shell plugin"
  omz update 

  echo "checking Apple Updates"
  /usr/sbin/softwareupdate -ia

  exit 0
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/packer packer

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# --- setup fzf theme ---
#fg="#CBE0F0"
#bg="#011628"
#bg_highlight="#143652"
#purple="#B388FF"
#blue="#06BCE4"
#cyan="#2CF9ED"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

#export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ----- Bat (better cat) -----

export BAT_THEME="tokyonight_night"

# ---- Eza (better ls) -----

alias ls="eza --icons=always"

# ---- TheFuck -----

# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)


alias cd="z"

# Function to remove a file from a git repository
function git-forget-blob
{
  test -d .git || { echo "Need to be at the base of a Git repository." && return 1; }
  git repack -Aq
  ls .git/objects/pack/*.idx &>/dev/null || {
    echo "There is nothing to be forgotten in this repository." && return; 
  }
  echo "Read blobs..."
  local BLOBS=( $( git verify-pack -v .git/objects/pack/*.idx | grep blob | awk '{ print $1 }' ) )
  for ref in "${BLOBS[@]}"; do
    local FILE
    FILE=$( git rev-list --objects --all | grep "$ref" | cut -d" "  -f2- )
    [[ "$FILE" == "$1" ]] && break
    unset FILE
  done
  [[ "$FILE" == "" ]] && { echo "$1 not found in the repository history." && return; }

  echo "Wipe out remotes..."
  git branch -a | grep "remotes\/" | awk '{ print $1 }' | cut -f2 -d/ | while read -r r; do git remote rm "$r" 2>/dev/null; done
  echo "Modify history..."
  git filter-branch --index-filter "git rm --cached --ignore-unmatch '$FILE'" --force -- --branches --tags
  echo "Wipe out refs..."
  rm -rf .git/refs/original/ .git/refs/remotes/ .git/*_HEAD .git/logs/
  (git for-each-ref --format="%(refname)" refs/original/ || echo :) | xargs --no-run-if-empty -n1 git update-ref -d
  echo "Wipe out reflog..."
  git reflog expire --expire-unreachable=now --all
  git repack -q -A -d
  echo "GC prune..."
  git gc --aggressive --prune=now
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Lima 
source <(limactl completion zsh)

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.9/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)
#
eval "$(starship init zsh)"
#source <(oc completion zsh)
export KUBE_EDITOR='nvim'
export CC=$(which gcc-15)

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Cilium completion 
source <(cilium completion zsh)

# KubeVirt  completion 
source <(virtctl completion zsh)

# Stern completion
source <(stern --completion zsh)

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
