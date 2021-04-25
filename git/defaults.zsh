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
# Aliases
# ======================================================================================

# Lot's of aliases will be sourced when we use oh-my-zsh because
# I will be using their git plugin. So, check the cheatsheet.
# https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet#git

alias gstash="git stash" # For some reason cheatsheet doesn't default stash.
alias gp="git push" # For some reason cheatsheet doesn't default push.
alias gpristinesoft="git clean -dffx" # Clears all untracked files.
alias gundo="git reset HEAD~1" # Undo last commit.

# ======================================================================================
# Functions
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
      gstash
    fi &&
    gpristinesoft &&
    gco "$ref" &&
    gf "upstream" &&
    grb "upstream/$ref" &&
    gp "origin/$ref"
}

# ======================================================================================
# Default Command Executions
# ======================================================================================

echo "Loaded git defaults ✅"
