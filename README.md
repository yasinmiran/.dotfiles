# Yasin's .dotfiles

These are my `dotfiles`!. You should definitely go through the files and tweak them to your needs if want to do so. Below is a comprehensive explanation on how do I structure these dotfiles.

## Terminology

Lot of the dotfiles repo's out there has a linear file structure. But in here I categorized based on modules. So, for each utilities that has possible dotfiles will have their own module. For example, `git`, `vim`, `brew` etc.

If you see one of the below named files in any of the available modules, this is what it means.

### `defaults`
Purpose to hold all the default commands, functions, aliases and related configurations which are loaded to the shell environment.

### `setup_*`
Purpose to hold all the bootstrapping logic for a new machine. Usually, this will be executed in the `shell` when we run `./install` file.

## How to `install`?

First navigate to home `cd` and clone the repository using `git clone https://github.com/yasinmiran/.dotfiles.git` and
navigate to dotfiles director using `cd ~/.dotfiles`. Now execute the command below to get started!

```bash
$ ./install
```

After executing above command, dotfiles are linked successfully. To pickup the changes you must quit the current terminal process and all the functions will be preloaded to your zsh environment. Now you can re-run the installation command like below.

## Kudos 🧙🏻‍♂️

My dotfiles are **inspired by** some amazing dotfiles projects out there. Also, checkout this [curated list](https://github.com/webpro/awesome-dotfiles) for more amazing stuff!

- [Anish's dotfiles](https://github.com/anishathalye/dotfiles)
- [Mathias's dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Bo's dotfiles](https://github.com/janusboandersen/dotfiles)
- [Raf's dotfiles](https://github.com/rafaeleyng/dotfiles)
- [Ryan's dotfiles](https://github.com/ryanb/dotfiles)
- [Holman's dotfiles](https://github.com/holman/dotfiles)
