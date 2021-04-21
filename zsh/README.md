# Purposes of `zsh` .files

## `.zshenv`

This file is always sourced, so it should set environment variables that need to be updated frequently. It often
contains exported variables that should be available to other programs, For example, `$PATH`, `$EDITOR` are often set in
`.zshenv`.

This file is read when `zsh` is launched to run a single command as well. The commands which run which runs once and
which should be updated on each new shell must be declared in this file.

## `.zshrc`

`.zshrc` is for interactive shell configuration. We can set the following options for the interactive shell in this
file.

- Command completion
- Correction
- Suggestion
- Highlighting
- Aliases
- Key bindings
- Commands
- History management
- Set any variables

That are only used in the interactive shell `$LS_COLORS`. Non-Interactive shell is used to execute a script for once
whereas an Interactive shell is invoked whenever we open a new terminal

## `.zlogin`

`.zlogin` is sourced at the start of a login shell. This file is sourced after `.zshrc` file and it helps in maintaining
commands to be run when the shell is fully setup.

## `.zprofile`

`.zprofile` is basically the same as `.zlogin` except that it's sourced directly before `.zshrc` is sourced instead of
directly after it. According to the zsh documentation, `.zprofile` is meant as an alternative to `.zlogin`. The two are
not intended to be used together, although this could certainly be done if desired.".

It is advised to have command in `.zprofile` which may take some time to complete or variables that are not updated
frequently.

## `.zlogout`

It is used to clear and reset the terminal, so it should be used to release all the resources acquired at the time of
login.
