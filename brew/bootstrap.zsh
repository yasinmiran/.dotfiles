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

set -e

# ======================================================================================
# FUNCTIONS
# ======================================================================================

# Install homebrew via curl. If brew is already installed
# then just update the packages and exit.
# Documentation: https://docs.brew.sh/Installation
function install_homebrew() {
  if [[ $(which -s brew) != 0 ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo -e "Download skipped. Brew $BREW_EMOJI is already installed."
  fi
}

# This function writes all installed casks/formulae/images/taps
# into a `Brewfile` in the current directory.
#
# @arg -v install prints output from commands as they are run.
# check lists all missing dependencies.
#
# @arg -f dump overwrites an existing Brewfile. cleanup actually
# performs its cleanup operations.
#
# @arg --describe dump adds a description comment above each line,
# unless the dependency does not have a description.
function update_brewfile() {
  echo -e "Updating the Brewfile $BREW_EMOJI with descriptions" &&
    brew dump -v -f --describe
}

# Install all the dependencies using the available `Brewfile`.
# First it will tap necessary repos and install packages then casks.
function brew_bundle_all() {
  echo -e "Bundling brew $BREW_EMOJI via Brewfile" &&
    brew bundle --verbose
}

# ======================================================================================
# EXPORTS
# ======================================================================================

# TODO: Keep an eye out for a different `--no-quarantine` solution.
# Currently, you can't do `brew bundle --no-quarantine` as an option.
# export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"
# https://github.com/Homebrew/homebrew-bundle/issues/474
readonly HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"
readonly BREW_EMOJI="\xf0\x9f\x8d\xba"

export HOMEBREW_CASK_OPTS

# ======================================================================================
# BOOTSTRAP
# ======================================================================================

echo -e "Bootstrapping homebrew $BREW_EMOJI" &&
  install_homebrew &&
  brew_bundle_all
