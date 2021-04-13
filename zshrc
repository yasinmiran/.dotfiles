# Paths

export TOMCAT_HOME=/Users/yasin/Desktop/apache-tomcat-9.0.43/ # Catalina home base
export JAVA_HOME=$(/usr/libexec/java_home -v1.8)              # Java home
export PATH="$PATH:/Users/yasin/binaries/flutter/bin"         # Flutter path

# Globals

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Aliases

alias only_theme="build theme"
alias create_and_run_docker_ins= "docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=myStrong420(786)' -e 'MSSQL_PID=Express' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2017-latest"
alias newpack='/bin/bash -c "$(curl -fsSL https://$MY_ACCESS_TOKEN@raw.githubusercontent.com/wso2-enterprise/asgardeo-product/HEAD/local/script.sh)"'

# Keys

export MY_ACCESS_TOKEN=af11d683ef94620a344f4133fb77610a503cd052

# Functions

function build() {
  local modules
  modules=("$@")
  for mod in "${modules[@]}"; do
    echo "building $mod..."
    if [[ ! -z "$mod" ]]; then
      npx lerna run --scope @wso2is/"$mod" build
    fi
  done
}

function suwm() {
  local ref
  ref=${1:-"master"}
  git status &&
    git stash &&
    echo "force removing untracked files and folders" &&
    git clean -d -f -f &&
    git checkout "$ref" &&
    echo "switched to master and syncing with upstream" &&
    git fetch upstream &&
    git rebase upstream/"$ref" &&
    git push origin "$ref"
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
