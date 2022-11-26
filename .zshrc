export XDG_CONFIG_HOME="$HOME/.config"

# chruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

source ~/.zshrc.common
source ~/.zshrc.zigbang
fpath+=${ZDOTDIR:-~}/.zsh_functions

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

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/deptno/workspace/src/github.com/zigbang/account/packages/zigbang-account/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/deptno/workspace/src/github.com/zigbang/account/packages/zigbang-account/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/deptno/workspace/src/github.com/zigbang/account/packages/zigbang-account/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/deptno/workspace/src/github.com/zigbang/account/packages/zigbang-account/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/deptno/workspace/src/github.com/zigbang/account/packages/zigbang-account/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/deptno/workspace/src/github.com/zigbang/account/packages/zigbang-account/node_modules/tabtab/.completions/slss.zsh