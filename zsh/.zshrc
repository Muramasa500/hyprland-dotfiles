
# =========================================================
# =====                 LOAD PLUGINS                  =====
# =========================================================
[[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -r /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]] && source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# zsh-syntax-highlighting should be sourced last
[[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add zsh-completions to the function path
fpath+=(/usr/share/zsh/site-functions)


# =========================================================
# =====              COMPLETION SYSTEM                =====
# =========================================================
autoload -Uz compinit

ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$ZSH_CACHE_DIR"

compinit -d "$ZSH_CACHE_DIR/zcompdump-$ZSH_VERSION"

# Completion styling
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"



# =========================================================
# =====           INTERACTIVE SHELL CHECK             =====
# =========================================================
[[ -o interactive ]] || return

# --- PATH ---
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"


# =====================================================
# =====             SHARED HISTORY                =====
# =====================================================
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt EXTENDED_HISTORY

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt APPEND_HISTORY

# =====================================================
# =====                  ALIASES                  =====
# =====================================================
# Uncomment to use paru as pacman
# if command -v paru &> /dev/null; then
#     alias pacman='paru'
# fi

if command -v sudo-rs >/dev/null 2>&1; then
    alias sudo='sudo-rs'
fi

if command -v eza &> /dev/null; then
    alias ls='eza --icons=auto'
    alias ll='eza -al --icons=auto --group'
    alias la='eza -a --icons=auto'
    alias l='eza --grid --icons=auto'
else
    alias ls='ls --color=auto'
    alias ll='ls -la --color=auto'
    alias la='ls -A --color=auto'
    alias l='ls -CF --color=auto'
fi

if command -v dust &> /dev/null; then
    alias du='dust'
fi

if command -v fd &> /dev/null; then
    alias find='fd'
fi

if command -v bat &> /dev/null; then
    alias cat='bat'
fi

if command -v rg &> /dev/null; then
    alias grep='rg'

    # Search in specific file types
    alias rgpy='rg --type py'
    alias rgjs='rg --type js'
    alias rgsh='rg --type sh'
    # Search only filenames
    alias rgf='rg --files --hidden'
    # Count matches
    alias rgc='rg --count-matches'
    # Show context (lines before/after)
    alias rgg='rg --context 2'
fi

if command -v procs &> /dev/null; then
    alias ps='procs'
fi

alias zed='zeditor'

# =====================================================
# =====               GIT ALIASES                 =====
# =====================================================
# Bat colorized
alias ghi='bat <(gh issue view "$@")'

# FIXME: gh completion not working
# completion
# source <(gh completion -s zsh) >> ~/.zshrc
# mkdir -p ~/.local/share/zsh/completion
# gh completion -s zsh > ~/.local/share/zsh/completion/_gh

# fzf integration
alias ghr='gh pr list | fzf --reverse --preview "gh pr view {}"'


# =====================================================
# =====              FZF INTERGRATION             =====
# =====================================================
# Adds:
# Ctrl+R: Search command history
# Ctrl+T: Fuzzy search and insert file paths
# Alt+C: Fuzzy search directories and change into them
# TODO: added chafa from pacman, add preview of images in terminal, had ghost image in last test
if command -v fzf &> /dev/null; then
    # Commands
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git --exclude node_modules --exclude target'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git --exclude node_modules'

    # Global Options, Catppuccin theme
    export FZF_DEFAULT_OPTS="
        --color=bg+:#313244,bg:#181825,spinner:#a6e3a1,hl:#f9e2af
        --color=fg:#cdd6f4,header:#f5c2e7,info:#fab387,pointer:#f38ba8
        --color=marker:#a6e3a1,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f9e2af
        --color=border:#585b70
        --height 80%
        --border rounded
        --preview 'bat --style=numbers --color=always {}'
        --no-bold
        --reverse
    "

    # Override for History (No preview, same height)
    export FZF_CTRL_R_OPTS="--no-preview --height 80%"

    # Initialize fzf
    eval "$(fzf --zsh)"
fi


# Directory Navigation Shortcuts, auto-cd
# cd into directories by typing just the directory name, no cd prefix needed
setopt AUTOCD

# Directory stack (push/pop directories):
# PUSHD_IGNORE_DUPS — When change directories, zsh remembers them in a "stack." This option prevents duplicate entries in that stack.
setopt PUSHD_IGNORE_DUPS
alias pd='popd'

# Fix delete key
bindkey "^[[3~" delete-char

# =====================================================
# =====            ZOXIDE INTERGRATION            =====
# =====================================================
# zoxide integration
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi
# alias cd='z'           # Replace cd entirely with z
# alias cdi='zi'         # Interactive version


# =====================================================
# =====            DIRENV INTERGRATION            =====
# =====================================================
if command -v direnv &> /dev/null; then
    eval "$(direnv hook zsh)"
fi


# =====================================================
# =====          ENVIRONMENT VARIABLES            =====
# =====================================================
export CLICOLOR=1
export PAGER=less
export EDITOR=nano


# =====================================================
# =====             MAN PAGE COLORS               =====
# =====================================================
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;32m'
export LESS_TERMCAP_ue=$'\e[0m'

# =====================================================
# =====           PROMPT CONFIGURATION            =====
# =====================================================
# Initialize vcs_info for Git status
# autoload -Uz vcs_info
# precmd() { vcs_info }
# zstyle ':vcs_info:git:*' formats ' %F{green}(%b)%f'
# zstyle ':vcs_info:hg:*' formats ' %F{yellow}(%b)%f'


# =====================================================
# =====              START COMMANDS               =====
# =====================================================
# Show fastfetch at startup
if command -v fastfetch &> /dev/null; then
    fastfetch
fi

# =====================================================
# =====            INITIALIZE STARSHIP            =====
# =====================================================
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi
