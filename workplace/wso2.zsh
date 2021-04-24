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
# FUNCTIONS
# ======================================================================================

# Abbreviated for: build_identity_apps
#
# Build identity-apps sub modules. For example
# I can pass `$ bia core theme console` to just build
# those three modules.
function bia() {
  local modules
  modules=("$@")
  for mod in "${modules[@]}"; do
    echo "building $mod..."
    if [[ -n "$mod" ]]; then
      npx lerna run --scope @wso2is/"$mod" build
    fi
  done
}

# Abbreviated for: start wso2 server
#
# Usually executed as ./wso2server.sh with this function
# I can execute `$ sws 9443` with a custom port offset
# which is handled for me internally.
function sws() {
  local port abs && port=${1:-9443} && abs=$((9443 - port))
  if ((abs > 0)); then
    abs="-$abs"
  else
    abs=${abs#-}
  fi
  readonly heart_emoji="\xf0\x9f\xa5\xb3\x0a" &&
    echo -e "Starting wso2is server $heart_emoji with port offset: $abs => $port" &&
    ./wso2server.sh "-DportOffset=$abs"
}
