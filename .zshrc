source ~/.zshrc.common
source ~/.zshrc.zigbang

if [[ -z "$TMUX" ]]; then
  if [[ -d ${XDG_CONFIG_HOME:-$HOME/.config}/nnn/plugins ]]; then
    plugins=$(ls ${XDG_CONFIG_HOME:-$HOME/.config}/nnn/plugins | wc -l)

    if [[ plugins -eq 0 ]]; then
      echo "install nnn plugins"
      curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
    fi
  fi
  
  if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi

  if [[ ! -z "$SSH_CONNECTION" ]]; then
    tmux attach -t default || tmux new -s default
    exit
  fi
fi
