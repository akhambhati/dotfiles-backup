# Setup main environmental variables
export DOTFILES=$HOME/Dotfiles
export ZSH=$DOTFILES/cfg/zsh

# Load Antigen
. $HOME/bin/antigen.zsh

# Load the oh-my-zsh’s library
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell’s oh-my-zsh)
antigen bundle autojump        # Enable auto jump when installed with homebrew
antigen bundle brew            # Adds brew completion, enables the brews command   
antigen bundle common-aliases  # Collection of useful zsh aliases ls et al.
antigen bundle compleat        # Bash completion
antigen bundle git             # Adds git aliases
antigen bundle git-extras      # Tab after various git commands autofills fields
antigen bundle git-flow        # Enforces the git-flow model
antigen bundle pip             # PIP completion
antigen bundle tmux            # Can set various tux options
antigen bundle web-search      # Can do shell-based web searches

# Tracks your most used directories, based on frequency.
antigen bundle z
autoload -Uz add-zsh-hook
add-zsh-hook precmd _z_precmd
function _z_precmd {
    _z --add "$PWD"
}

# History search
antigen bundle zsh-users/zsh-history-substring-search

# syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

# autocomplete
antigen bundle tarruda/zsh-autosuggestions

# Load the theme
antigen theme $DOTFILES/cfg/zsh shadyenigma.zsh-theme --no-local-clone

# Tell antigen that you’re done
antigen apply

# Setup environmental variables
source $HOME/.bindings
source $HOME/.env
source $HOME/.exports
source $HOME/.aliases
source $HOME/.history

# Load Freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

"""
# Autoload the Hoth Conda Environment
chvenv Hoth

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/akhambhati/Dev/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/akhambhati/Dev/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/akhambhati/Dev/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/akhambhati/Dev/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
"""

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
