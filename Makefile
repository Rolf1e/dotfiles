GIT_DOTFILES_REPO_PATH ?= ~/Documents/dotfiles
DOT_CONFIG_PATH ?= ~/.config
SOFTWARES_FOLDER ?= /media/rolfie/ssd2/softwares

#alacritty
alacritty-install:
	cargo install alacritty

alacritty-symlinks:
	ln -s $(GIT_DOTFILES_REPO_PATH)/alacritty $(DOT_CONFIG_PATH)/alacritty

alacritty: alacritty-install alacritty-symlinks

# unix tools
xclip:
	apt install xclip

compton:
	apt install compton

tools-apt: xclip compton

ripgrep:
	cargo install ripgrep

tools-cargo: ripgrep

tools: tools-cargo tools-apt

# i3
i3-symlinks:
	ln -s $(GIT_DOTFILES_REPO_PATH)/i3 $(DOT_CONFIG_PATH)/i3

# neovim
vim-plug:
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

neovim-pull:
	cd $(SOFTWARES_FOLDER)/neovim && git pull

neovim-build:
	make -C $(SOFTWARES_FOLDER)/neovim CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make -C $(SOFTWARES_FOLDER)/neovim install

neovim-update: neovim-pull neovim-build

neovim-clone:
	cd $(SOFTWARES_FOLDER) && git clone https://github.com/neovim/neovim 

neovim-symlinks:
	ln -s $(GIT_DOTFILES_REPO_PATH)/nvim $(DOT_CONFIG_PATH)/nvim

neovim-colors: 
	ln -s $(GIT_DOTFILES_REPO_PATH)/.rolfie_colors.json $(DOT_CONFIG_PATH)/.rolfie_colors.json

neovim-first: vim-plug neovim-clone neovim-update neovim-symlinks neovim-colors

neovim: neovim-update 

symlinks: neovim-symlinks alacritty-symlinks i3-symlinks

