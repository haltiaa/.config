# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="spaceship"

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
zstyle ':omz:update' mode auto      # update automatically without asking
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
if [[ $(uname) != "Darwin" ]]; then
    plugins=(git conda fzf fzf-tab fzf-tab-source zsh-autosuggestions ssh-agent keychain conda-env)
    zstyle :omz:plugins:keychain agents ssh
    export FZF_DEFAULT_OPTS="--height=80% --preview 'fzf-preview.sh {}' --ansi"
    export FZF_DEFAULT_COMMAND='fdfind --type file --type l --type d --follow --hidden --color=always --exclude .git --exclude .cache'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
else
    plugins=(git fzf fzf-tab fzf-tab-source zsh-autosuggestions)
    export FZF_DEFAULT_OPTS="--height=80% --preview 'fzf-preview.sh {}'" 
fi

# ZSH_TMUX_AUTOSTART=true


# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
zstyle ':fzf-tab:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|~/.lessfilter %s'

# zstyle ':fzf-tab:*' popup-min-size 120 40
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# zstyle ':fzf-tab:complete:*' fzf-preview 'bat $words[1]'
# zstyle ':fzf-tab:*' use-fzf-default-opts yes

# fpath=("~/.oh-my-zsh/completions" $fpath)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH/oh-my-zsh.sh



# RPROMPT="$(conda_prompt_info)"
# PROMPT="$(conda_prompt_info) $PROMPT"



export LESS='--mouse --wheel-lines=3'


# unset CONDA_CHANGEPS1
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
if [[ $(uname) != "Darwin" ]]; then
    PATH=$PATH:/home/halti/.local/bin
fi

if [[ $(uname) == "Darwin" ]]; then
    PATH=$PATH:/Users/haltia/.local/bin
fi
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

export EDITOR='hx'
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
alias zshconfig="hx ~/.zshrc"
alias ohmyzsh="hx ~/.oh-my-zsh"
if [[ $(uname) != "Darwin" ]]; then
    alias bat='batcat'
fi
alias catcat='cat'
alias cat='bat'
alias ls='eza -ha --grid --group-directories-first --classify=always --git --color=always --icons'
alias y='yazi'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/halti/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/halti/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/halti/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/halti/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

eval "$(zoxide init zsh)"
alias cd='z'

if type uv > /dev/null; then
    eval "$(uv generate-shell-completion zsh)"
    eval "$(uvx --generate-shell-completion zsh)"
fi

# ZELLIJ_CONFIG_DIR="$HOME/.config/zellij"

if [[ $(uname) == "Darwin" ]]; then
    export SSH_AUTH_SOCK=/Users/haltia/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock
fi

cd ~

ZELLIJ_AUTO_ATTACH=true
# eval "$(zellij setup --generate-auto-start zsh)"

# [ -f "/home/halti/.ghcup/env" ] && . "/home/halti/.ghcup/env" # ghcup-env
