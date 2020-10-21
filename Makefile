SHELL:=/bin/bash
FLAGS:=-B
all:; @$(MAKE) _all $(FLAGS)
_all: config

config: Makefile
	stow --verbose=0 --target $(XDG_CONFIG_HOME) config
	ln -sfr config/profile "${HOME}/.profile"
	ln -sfr config/bashrc "${HOME}/.bashrc"
	ln -sfr config/zshrc "${HOME}/.zshrc"

install:
	# TODO
