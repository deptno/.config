source .config/antigen.zsh

# Load the oh-my-zsh's library.
# antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle emoji-cli
antigen bundle brew-services

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply
eval "$(direnv hook zsh)"
