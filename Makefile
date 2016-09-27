all: homebrew node python iterm

install:
		@./script/install

symlink:
		@./script/symlink

homebrew:
		@sh ./homebrew/homebrew.sh

node:
		@sh ./node/packages.sh

python:
		@sh ./python/packages.sh

iterm:
		@sh ./iterm2/themes.sh

osx:
		@source ~/.dotfiles/osx/macos.local

.PHONY: symlink homebrew node python iterm osx
