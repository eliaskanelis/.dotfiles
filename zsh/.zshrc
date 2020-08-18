########################################################
# Custom functions #####################################
#

cdUndoKey() {
    popd
    zle       reset-prompt
    echo
    ls
    zle       reset-prompt
}
zle -N cdParentKey

cdParentKey() {
    pushd ..
    zle      reset-prompt
    echo
    ls
    zle       reset-prompt
}
zle -N cdUndoKey

########################################################
# ZSH does not use readline ############################
#

# Alot of these keybindings will be replaced by ohmyzsh plugins
# that is why these are included at the top of zshrc

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"
key[F1]="${terminfo[kf1]}"
key[F2]="${terminfo[kf2]}"

# setup key accordingly
[[ -n "${key[Home]}"          ]] && bindkey -- "${key[Home]}"          beginning-of-line
[[ -n "${key[End]}"           ]] && bindkey -- "${key[End]}"           end-of-line
[[ -n "${key[Insert]}"        ]] && bindkey -- "${key[Insert]}"        overwrite-mode
[[ -n "${key[Backspace]}"     ]] && bindkey -- "${key[Backspace]}"     backward-delete-char
[[ -n "${key[Delete]}"        ]] && bindkey -- "${key[Delete]}"        delete-char
[[ -n "${key[Up]}"            ]] && bindkey -- "${key[Up]}"            up-line-or-history
[[ -n "${key[Down]}"          ]] && bindkey -- "${key[Down]}"          down-line-or-history
[[ -n "${key[Left]}"          ]] && bindkey -- "${key[Left]}"          backward-char
[[ -n "${key[Right]}"         ]] && bindkey -- "${key[Right]}"         forward-char
[[ -n "${key[PageUp]}"        ]] && bindkey -- "${key[PageUp]}"        beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"      ]] && bindkey -- "${key[PageDown]}"      end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"     ]] && bindkey -- "${key[Shift-Tab]}"     reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
[[ -n "${key[F1]}"            ]] && bindkey -- "${key[F1]}"            cdParentKey
[[ -n "${key[F2]}"            ]] && bindkey -- "${key[F2]}"            cdUndoKey

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop  { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.config/oh-my-zsh/ohmyzsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
ZSH_CUSTOM=~/.config/oh-my-zsh/custom/

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Emacs keybindings
bindkey -e

#export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='emacsclient -t -create-frame --alternate-editor='
else
    export EDITOR='emacsclient -create-frame --alternate-editor='
fi

export VISUAL='emacsclient -create-frame --alternate-editor='

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

#export CPPUTEST_DIR="${HOME}/opt/cpputest/"
export PC_LINT_DIR="${HOME}/opt/Pc-lint"

export PATH=${HOME}/opt/gcc-arm-none-eabi/bin:$PATH''

# Connect to a session called TMUX when you launch terminal.
#if [ -z "$TMUX" ]
#then
#    tmux attach -t TMUX || tmux new -s TMUX -c "$PWD"
#fi

neofetch

########################################################
# History ##############################################
#
#

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

########################################################
# Indepentant of zsh ###################################
#
#

# Load wal colors if they exist
if [[ -f "${HOME}/.cache/wal/colors.sh" ]]; then
    . "${HOME}/.cache/wal/colors.sh"
fi

export GTK2_RC_FILES=${HOME}/.gtkrc-2.0


########################################################
# Python startup script ################################
#
#

export PYTHONSTARTUP=~/.pythonrc


########################################################
# Pip autocompletion ###################################
#
#

if command -v pip3 &> /dev/null
then
    # This is the original way but is slow
    #eval "$(pip3 completion --zsh)"

    # This is a workaround for speed optimization
    file=~/.cache/pip/pip_completion_zsh
    mkdir -p $(dirname ${file})
    [ -f ${file} ] || pip3 completion --zsh > ${file}
    eval "$(cat ${file})"
fi

########################################################
# Automatic virtual environment ########################
#
#

function cd() {
    if [[ -d ./.venv ]] ; then
	if command -v deactivate &> /dev/null
	then
	    deactivate
	fi
    fi

    builtin cd $1

    if [[ -d ./.venv ]] ; then
	. ./.venv/bin/activate
	# Autocompletion for invoke
	if command -v invoke &> /dev/null
	then
	    source <(invoke --print-completion-script zsh)
	fi
    fi
}

########################################################
# Ssh agent ############################################
#
#

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
	start_agent;
    }
else
    start_agent;
fi

########################################################
# Take me to a brand new playground ####################
#
#

sandbox() {
    #NAME=${RANDOM}
    NAME=$(shuf -n1 /usr/share/dict/words | sed -e 's/[^A-Za-z0-9._-]/_/g')

    rm -rf   /tmp/gimme_playground/${NAME}
    mkdir -p /tmp/gimme_playground/${NAME}
    cd       /tmp/gimme_playground/${NAME}
}

########################################################
# Powerline10k prompt ##################################
#
#

# To customize prompt, run 'p10k configure'
[[ ! -f ~/.config/oh-my-zsh/p10k.zsh ]] || source ~/.config/oh-my-zsh/p10k.zsh
