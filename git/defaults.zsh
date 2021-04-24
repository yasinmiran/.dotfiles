#!/usr/bin/env zsh

# MIT License
#
# Copyright (c) 2021 Yasin Miran
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# ======================================================================================
# ALIASES
# ======================================================================================

# I stole these from the curated list of awesome git aliases.
# I've categorized them based on my preferences.
# https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet#git

alias g="git"
alias gi="git"
alias gt="git"
alias gut="git"
alias got="git"
alias gitt="git"
alias hit="git" # LOL trust me I've done this before.

alias ga="git add"
alias gau="git add --update" # (Also: "git add -u")
alias gaa="git add --all"
alias gapa="git add --patch"

alias gp="git push"
alias gpd="git push --dry-run"
alias gpoat="git push origin --all && git push origin --tags"
alias gpu="git push upstream"
alias gpv="git push -v"
alias ggpush='git push origin $(current_branch)'
alias ggp='git push origin $(current_branch)'
alias ggfl='git push --force-with-lease origin <your_argument>/$(current_branch)'
alias gpsup='git push --set-upstream origin $(current_branch)'

alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gbda='git branch --no-color --merged | command grep -vE "^(+|*|\s*($(git_main_branch)|development|develop|devel|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gbnm="git branch --no-merged"
alias gbr="git branch --remote"
alias ggsup='git branch --set-upstream-to=origin/$(current_branch)'

alias gc="git commit -v"
alias gc!="git commit -v --amend"
alias gca="git commit -v -a"
alias gca!="git commit -v -a --amend"
alias gcan!="git commit -v -a --no-edit --amend"
alias gcans!="git commit -v -a -s --no-edit --amend"
alias gcam="git commit -a -m"
alias gcsm="git commit -s -m"
alias gcmsg="git commit -m"
alias gcs="git commit -S"

alias gf="git fetch"
alias gfa="git fetch --all --prune"
alias gfo="git fetch origin"

alias gpl="git pull"
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
alias ggpull='git pull origin $(current_branch)'
alias ggl='git pull origin $(current_branch)'
alias ggpur='git pull --rebase origin $(current_branch)'
alias ggu='git pull --rebase origin $(current_branch)'
alias glum='git pull upstream $(git_main_branch)'
alias gup="git pull --rebase"
alias gupv="git pull --rebase -v"

alias gcb="git checkout -b"
alias gcm='git checkout $(git_main_branch)'
alias gcd="git checkout develop"
alias gco="git checkout"

alias gss="git status -s"
alias gst="git status"
alias gsb="git status -sb"

alias gsth="git stash"
alias gsta="git stash push"
alias gstaa="git stash apply"
alias gstd="git stash drop"
alias gstl="git stash list"
alias gstp="git stash pop"
alias gstc="git stash clear"
alias gsts="git stash show --text"

alias glg="git log --stat"
alias glgg="git log --graph"
alias glgga="git log --graph --decorate --all"
alias glgm="git log --graph --max-count=10"
alias glgp="git log --stat -p"
alias glo="git log --oneline --decorate"
alias glog="git log --oneline --decorate --graph"
alias glol="git log --graph --pretty=\'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\'"
alias glola="git log --graph --pretty=\'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --all"
alias glp="_git_log_prettily" # (Also: "git log --pretty=$1")

alias gr="git remote"
alias gra="git remote add"
alias grmv="git remote rename"
alias grrm="git remote remove"
alias grset="git remote set-url"
alias grup="git remote update"
alias grv="git remote -v"

alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbd="git rebase develop"
alias grbi="git rebase -i"
alias grbm='git rebase $(git_main_branch)'
alias grbs="git rebase --skip"

alias gm="git merge"
alias gma="git merge --abort"
alias gmom='git merge origin/$(git_main_branch)'
alias gmt="git mergetool --no-prompt"
alias gmtvim="git mergetool --no-prompt --tool=vimdiff"
alias gmum='git merge upstream/$(git_main_branch)'

alias gcln="git clone"
alias gcl="git clone --recurse-submodules"

alias gccd="git clean -dffx"
alias gclean="git clean -id"
alias grh="git reset" # (Also: "git reset HEAD")
alias grhh="git reset --hard" # (Also: "git reset HEAD --hard")
alias gpristine="git reset --hard && git clean -dffx"
alias gru="git reset --"
alias gupc="git reset HEAD~1" # Undo last commit.

alias gd="git diff"
alias gdca="git diff --cached"
alias gds="git diff --staged"
alias gdt="git diff-tree --no-commit-id --name-only -r"
alias gdw="git diff --word-diff"

alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"

alias gbs="git bisect"
alias gbsb="git bisect bad"
alias gbsg="git bisect good"
alias gbsr="git bisect reset"
alias gbss="git bisect start"

# alias gcount="git shortlog -sn"
# alias gcf="git config --list"
# alias gbl="git blame -b -w"
# alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
# alias gg="git gui citool"
# alias gga="git gui citool --amend"
# alias ghh="git help"
# alias gignore="git update-index --assume-unchanged"
# alias gignored="git ls-files -v"
# alias git='-svn-dcommit-push	git svn dcommit && git push github master:svntrunk'
# alias gk="\gitk --all --branches"
# alias gke='\gitk --all $(git log -g --pretty=%h)'
# alias grs="git restore"
# alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
# alias gsd="git svn dcommit"
# alias gsi="git submodule init"
# alias gsps="git show --pretty=short --show-signature"
# alias gsr="git svn rebase"
# alias gsu="git submodule update"
# alias gts="git tag -s"
# alias gunignore="git update-index --no-assume-unchanged"
# alias gunwip='git log -n 1 | grep -q -c "--wip--" && git reset HEAD~1'
# alias gvt="git verify-tag"
# alias gwch="git whatchanged -p --abbrev-commit --pretty=medium"
# alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'

# ======================================================================================
# FUNCTIONS
# ======================================================================================

# suwm: Sync Up With Main/Master
#
# Sync up with main branch. This function is a quick way to
# sync the origin main branch with the upstream main.
# @arg $1 main/master default is "master"
function suwm() {
  local ref && ref=${1:-"master"}
  gst &&
    if ask "Stash the changes?" Y; then
      gsth # Stash the current changes without any message.
    fi &&
    gccd &&
    gco "$ref" &&
    gf "upstream" &&
    grb "upstream/$ref" &&
    gp "origin/$ref"
}

echo "Loaded git defaults $TICK"
