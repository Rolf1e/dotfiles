alacritty:
	cargo install alacritty

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


# neovim
vim-plug:
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

neovim-build:
	cd ~/software/neovim && git pull
	make -C ~/software/neovim CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make -C ~/software/neovim install

neovim-clone:
	cd ~/software/ git clone https://github.com/neovim/neovim 

first-neovim: clone-neovim build-neovim

neovim: neovim-build
