export ZSH="$HOME/.oh-my-zsh"
export HISTSIZE=1000000
export EDITOR=code

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Golang envs
export GOPATH="$HOME/go"
export GOROOT=/usr/local/go
export GO111MODULE=on
export GOPRIVATE="github.com/mercadolibre"

# Meli project envs
export CONF_DIR="${PWD}/conf"
export DB_ENDPOINT="proxysql.master.melisseginf.com:6612"
export DB_PASS=""
export GO_CACHE="${HOME}/Library/Caches/go-build"
export GO_ENVIRONMENT="local"
export SCOPE="bigq"

# Session wide environment variables
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

export PATH="$PATH:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/system/cryptexes/app/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/macgpg2/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/users/lnatali/bin:/users/lnatali/go/bin:/users/lnatali/library/python/3.11/bin:/usr/local/go/bin:/users/lnatali/library/python/bin"

plugins=(git)

# Clear and reset scrollback
function clear-scrollback-buffer {
  clear && printf '\e[3J'
  zle && zle .reset-prompt && zle -R
}

zle -N clear-scrollback-buffer

# Aliases
alias g=git
alias cls=clear-scrollback-buffer

# bindkey '^?' kill-word
# bindkey '^?' kill-word
# bindkey '^H' backward-kill-word
# bindkey '^H' backward-kill-word

eval "$(starship init zsh)"
export GPG_TTY=$(tty)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

eval "$(_FURY_COMPLETE=source fury > /dev/null)"

# Start Colima and sets docker to use it
colima start --cpu 2 --memory 4 --mount-type 9p --arch aarch64 |& grep -v 'already running, ignoring'
docker context use colima |& grep -v colima
