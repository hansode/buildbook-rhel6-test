SHELL=/bin/bash

all:

setup: vendor/buildbook-rhel6
	git submodule update --init --recursive

vendor/buildbook-rhel6:
	([[ -d vendor/buildbook-rhel6 ]] || { cd vendor && git clone git@github.com:hansode/buildbook-rhel6.git; })
	(cd vendor/buildbook-rhel6 && git pull)

test: setup
	sudo ./test-print.sh

.PHONY: vendor/buildbook-rhel6
