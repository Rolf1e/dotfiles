#alacritty
alacritty-install:
	cargo install alacritty

alacritty-symlinks:
	ln -s ~/Documents/dotfiles/alacritty ~/.config/alacritty

alacritty: alacritty-install alacritty-symlinks

# unix tools
tmux:
	apt install tmux

xclip:
	apt install xclip

compton:
	apt install compton

tools-apt: tmux xclip compton

bat:
	cargo install --locked bat

ripgrep:
	cargo install ripgrep

tools-cargo: bat ripgrep

tools: tools-cargo tools-apt

# i3
i3-symlinks:
	ln -s ~/Documents/dotfiles/i3 ~/.config/i3

# starship
starship-symlinks:
	ln -s ~/Documents/dotfiles/starship.toml ~/.config/starship.toml

starship-install: 
	cargo install starship

starship: starship-install starship-symlinks

# neovim
vim-plug:
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

neovim-pull:
	cd ~/software/neovim && git pull

neovim-build:
	make -C ~/software/neovim CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make -C ~/software/neovim install

neovim-update: neovim-pull neovim-build

neovim-clone:
	cd ~/software && git clone https://github.com/neovim/neovim 

neovim-symlinks:
	ln -s ~/Documents/dotfiles/nvim ~/.config/nvim

neovim-first: vim-plug neovim-clone neovim-update neovim-symlinks

neovim: neovim-update 

# Personal - tmux creator
tmux-creator-clone:
	cd ~/software && git clone https://github.com/Rolf1e/tmux-creator

tmux-creator-build:
	cargo build --release --manifest-path ~/software/tmux-creator/Cargo.toml

tmux-creator-symlinks:
	ln -s ~/Documents/dotfiles/tmux-creator ~/.config/tmux-creator

tmux-creator: tmux-creator-clone tmux-creator-build

symlinks: tmux-creator-symlinks neovim-symlinks alacritty-symlinks i3-symlinks

