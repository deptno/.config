export XDG_CONFIG_HOME="$HOME/.config"

# chruby
if [[ -d /opt/homebrew/opt/chruby/share/chruby ]]; then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
fi
if [ -e ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
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

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
source <(helm completion zsh)
