SHELL:=/bin/bash
FLAGS:=/bin/bash
all:; @$(MAKE) _all $(FLAGS)
_all: config

config: Makefile
	stow --verbose=0 --target $(XDG_CONFIG_HOME) config

install:
	# TODO
