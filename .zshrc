export XDG_CONFIG_HOME="$HOME/.config"
if [ -e ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# powerlevel10k first
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export EDITOR='vim'

export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt EXTENDED_HISTORY

export GEM_HOME=~/.gem/ruby/2.6.8

export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

fpath+=${ZDOTDIR:-~}/.zsh_functions

# bun completions
[ -s "/Users/deptno/.bun/_bun" ] && source "/Users/deptno/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# chruby
if [[ -d /opt/homebrew/opt/chruby/share/chruby ]]; then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
fi

# android
if [[ -z $ANDROID_HOME ]]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export PATH=$PATH:~/.local/share/nvim/lsp_servers/rust
fi
export PATH=$HOME/bin:/usr/local/bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ohmyzsh
ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  bundler
  dotenv
  macos
  ruby
  z
  urltools
  rust
  node
  direnv
  aws
  kubectl
  kube-ps1
  kubetail
)

source $ZSH/oh-my-zsh.sh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
source <(helm completion zsh)

# bind hstr
if which hstr > /dev/null 2>&1; then \
  bindkey -s "\C-r" "\C-a hstr -- \C-j"; \
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# tpm
if [[ -z "$TMUX" ]]; then
  if [[ -d ${XDG_CONFIG_HOME:-$HOME/.config}/nnn/plugins ]]; then
    plugins=$(ls ${XDG_CONFIG_HOME:-$HOME/.config}/nnn/plugins | wc -l)

    if [[ plugins -eq 0 ]]; then
      echo "install nnn plugins"
      curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
    fi
  fi
  
  if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi

  if [[ ! -f ~/.oh-my-zsh/themes/zsh-syntax-highlighting.sh ]]; then
    curl https://raw.githubusercontent.com/dracula/zsh-syntax-highlighting/master/zsh-syntax-highlighting.sh -sSo ~/.oh-my-zsh/themes/zsh-syntax-highlighting.sh
  fi
  source ~/.oh-my-zsh/themes/zsh-syntax-highlighting.sh

  if [[ ! -z "$SSH_CONNECTION" ]]; then
    tmux attach -t default || tmux new -s default
    exit
  fi
fi

# alias
alias k=kubectl
alias calicoctl="kubectl exec -i -n kube-system calicoctl -- /calicoctl"
alias m=multipass
alias tt=neomutt
alias wol=$XDG_CONFIG_HOME/sh/wol_x5950.sh
alias min="open -a /Applications/Min.app"
alias ll="exa --long --all --icons --git --time-style=long-iso --color-scale --links --header --sort=mod --reverse --group-directories-first"
alias lln="exa --long --all --icons --git --time-style=long-iso --color-scale --links --header --reverse --group-directories-first"
alias hl-gh="GREP_COLOR='2;37' grep --color=always -E 'true|$' \
  | GREP_COLOR='2;36;47' grep --color=always -E 'false|$' \
  | GREP_COLOR='5;31;47' grep --color=always -Ei 'release\/|$' \
  | GREP_COLOR='1;33;41' grep --color=always -Ei 'prod\/|$' \
  | GREP_COLOR='2;32' grep --color=always -Ei 'master|APPROVED|$' \
  | GREP_COLOR='1;34' grep --color=always -E 'MERGEABLE|$' \
  | GREP_COLOR='2;37' grep --color=always -E 'UNKNOWN|MERGED|CONFLICTING|REVIEW_REQUIRED|$' \
  | GREP_COLOR='36' grep --color=always -Ei 'b2c-\d{5}|$' \
  | GREP_COLOR='1;3;4;33;41' grep --color=always -E 'Revert|$' \
  | GREP_COLOR='1;3;4;30;42' grep --color=always -E 'refs\/bisect\/good|$' \
  | GREP_COLOR='1;3;4;31;43' grep --color=always -E 'refs\/bisect\/bad|$' \
  | GREP_COLOR='1;30;47' grep --color=always -Ei 'deptno|deptno-zb|$'"
alias gpl="gh pr list \
  --json author,headRefName,baseRefName,comments,number,title,mergeable,createdAt,isDraft,state,reviewDecision,latestReviews \
  --template \
  '{{tablerow
  (\"#\"|color \"magenta\")
  (\"CREATED_AT\"|color \"magenta\")
  (\"STATE\"|color \"magenta\")
  (\"BASE\"|color \"magenta\")
  (\"HEAD\"|color \"magenta\")
  (\"CONFLICT\"|color \"magenta\")
  (\"AUTHOR\"|color \"magenta\")
  (\"DRAFT\"|color \"magenta\")
  (\"TITLE\"|color \"magenta\")
  (\"@REVIEW_DECISION\"|color \"magenta\")
  (\"LATEST_REVIEWS\"|color \"magenta\")
  (\"STATE\"|color \"magenta\")
}}
{{range .}}
{{tablerow
  .number
  (timeago .createdAt)
  .state
  .baseRefName
  (printf \"👈 %v\" .headRefName)
  .mergeable
  .author.login
  .isDraft
  .title
  (printf \"@%v\" .reviewDecision)
  (printf \"%v\" (join \",\" (pluck \"login\" (pluck \"author\" .latestReviews))))
  (printf \"%v\" (join \" \" (pluck \"state\" .latestReviews)))
}}
{{end}}'"
alias sudo="sudo "
alias watch="watch "
alias lz="lazygit"

# define function
function gswb() {
  gsw "$(git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short) - %(committerdate:relative)' | fzf |  awk '{print $1}')"
}
function gswr() {
  gsw "$(git for-each-ref --sort=-committerdate refs/remotes/origin/ --format='%(refname:short) %(committerdate:relative), %(authoremail), %(subject) - ' | fzf | awk '{print $1}' | sed 's|origin/||')"
}
function gmb() {
  gm --no-ff "$(git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short) - %(committerdate:relative)' | fzf |  awk '{print $1}')"
}
function gpld() {
  gpl "$@" \
  | sed '/^$/d' \
  | sed 's/[^@]COMMENTED/💬/g' \
  | sed 's/[^@]APPROVED/👍/g' \
  | sed 's/[^@]CHANGES_REQUESTED/👎/g' \
  | hl-gh;
}

if [[ $(uname -s) == "Darwin" ]]; then
  if [[ $(sysctl -n machdep.cpu.brand_string | cut -d ' ' -f1-2) == "Apple M1" ]]; then
    # alias for m1
    # alias brew="arch -arm64 brew"
    # alias ibrew="arch -x86_64 brew"
  fi
fi

function review() {
  # stash current status
  branch=@^2
  if [ ! -z "$1" ]; then
    branch=$1
  fi
  echo "$branch $1"
  git reset --mixed $(git merge-base @~ $branch)
  vim $(git diff --name-only --relative)
  git reset --hard HEAD
  git clean -fd
  git pull --rebase
}

# work specific
if [ -e ~/.zshrc.zigbang ]; then
  source ~/.zshrc.zigbang
fi

if [ -e $XDG_CONFIG_HOME/broot/launcher/bash/br ]; then
  source $XDG_CONFIG_HOME/broot/launcher/bash/br
fi
