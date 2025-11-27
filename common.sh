export PATH="$PATH"
export DOTFILES_DIR="$HOME/.dotfiles"
export DEVELOPMENT_DIR="$HOME/dev"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

alias d="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dev='cd $DEVELOPMENT_DIR'
alias bins='cd $BINARIES_DIR'
alias dotfiles='cd "$DOTFILES_DIR"'

alias cls="clear"

alias fit="git"
alias hit="git"
alias gut="git"
alias got="git"

alias grv="git remote -v"
alias gst="git status"
alias gstash="git stash"     
alias gstashall="git stash -u"
alias gp="git push"
alias gpristinesoft="git clean -dff"
alias gundo="git reset HEAD~1"

alias dpsa="docker ps -a --no-trunc | less -S"

alias rrr="exec zsh"

alias ls="ls -alh"

function atop() {
  local new_path && new_path=${1}
  if [[ -n "$new_path" ]] && [[ -d "$new_path" ]]; then
    PATH="$PATH:$new_path"
  else
    echo "Nothing done... path is invalid! ${new_path}"
  fi
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

