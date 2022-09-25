# Ilias's personal dotfiles

## Dependencies

1. [GNU Stow](https://www.gnu.org/software/stow/)
2. [Git](https://git-scm.com/)

## Installation

### Private Gitea server

WARNING!!! You do not have access to this server use Github instead.
Use the github mirror instead.

```sh
git clone --recurse-submodules git@kentavros.lan:tedi/.dotfiles.git ~/sync/
```

### Github mirror

```sh
git clone git@github.com:TediCreations/.dotfiles.git ~/sync/
```

then manually fix any private gitea related git submodules with the Github equivalent.

```sh
git submodule init
git submodule update
```

## Installing apps

For each program that has an available seperate install script, run it.

```sh
cd ~/sync/.dotfiles
./install_xxx
```

where xxx is the program.


## Linkage

```sh
cd ~/sync/.dotfiles
./link
```

## License

[GPL3](LICENSE) © Kanelis Ilias
