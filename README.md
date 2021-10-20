# Yasin's `.dotfiles`

These are my `dotfiles`!. You should first go through the files and tweak them to your needs if want to do so. Below is
a small explanation on how do I structure these dotfiles.

But before that I must say **thanks** to [eieioxyz](https://github.com/eieioxyz). His
amazing [course](https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/) on Udemy about dotfiles helped me to
understand some important topics in terminals. I highly encourage you to enroll in that course and learn more about
dotfiles in-depth!

## Terminology

Lot of the dotfiles repo's out there has a linear file structure. In this repo I categorized based on modules. So, for
each utility that has possible dotfiles will have their own module. For example, `git`, `vim`, `brew` etc. If you see
one of the below named files in any of the available modules, this is what it means.

1. `defaults`

Basically holds all the default commands, functions, aliases and related configurations which are loaded to the shell
environment.

2. `setup_*`

Purpose to hold all the bootstrapping logic for a new machine. Usually, this will be executed in the `shell` when we
run `./install` file.

## `install`?

First navigate to home `cd` and clone the repository using `git clone https://github.com/yasinmiran/.dotfiles.git` and
navigate to dotfiles director using `cd ~/.dotfiles`. Now execute the command below to get started!

#### Hol up 🚧🔧

Before that I usually, manually configure `git` and `ssh` access on a new machine. If you're running macOS Big Sur you
may have to grant your Terminal app `Full Disk Access` in order to smoothly execute `install` script.

```bash
$ ./install
```

After executing above command, dotfiles will get linked and all the sub `setup_*` scripts will execute in order. To pick
up the changes you must quit the current terminal process and all the functions will be preloaded to your zsh
environment. Now you can re-run the installation command like below.

## Many Kudos 🧙🏻‍♂️

My dotfiles are **inspired by** some amazing dotfiles projects out there. Also, checkout
this [curated list](https://github.com/webpro/awesome-dotfiles) for more amazing stuff!

- [eieioxyz](https://github.com/eieioxyz/dotfiles_macos)
- [Anish's dotfiles](https://github.com/anishathalye/dotfiles)
- [Mathias's dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Bo's dotfiles](https://github.com/janusboandersen/dotfiles)
- [Raf's dotfiles](https://github.com/rafaeleyng/dotfiles)
- [Ryan's dotfiles](https://github.com/ryanb/dotfiles)
- [Holman's dotfiles](https://github.com/holman/dotfiles)

## Things I'm currently working on

- [ ] Mapping IDE configurations (vscode, Idea).
- [ ] Map Vim configurations.
- [ ] Revisit SSH configurations.
