sudo pacman -S --noconfirm openssh neovim tmux unzip luarocks lua wget go cargo ruby php composer nodejs npm pyenv tree-sitter perl tree-sitter-cli fd

if ! command -v python3 &> /dev/null; then
	pyenv init 2>> ~/.bash_profile
	source ~/.bash_profile
	pyenv install 3.13.5
	pyenv global 3.13.5
fi

sudo npm install -g neovim

if [ ! -f ~/.ssh/id_ed25519 ]; then
	ssh-keygen -t ed25519 -C "abdulmohsen.jawad.almajed@gmail.com"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_ed25519
fi

cat ~/.ssh/id_ed25519.pub
cd ~/.config/ 

if [ ! -d ~/.config/nvim ]; then
	git clone git@github.com:abdul-mohsen/nvimConfig.git nvim
fi

if [ ! -d ~/.config/tmux ]; then
	git clone git@github.com:abdul-mohsen/tmuxConfig.git tmux
fi

mkdir -p ~/.local/share/fonts && wget -O- https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip | funzip > ~/.local/share/fonts/FiraCode.ttf && fc-cache -fv

# cpan Neovim::Ext

if [ ! -d ~/.config/tmux/plugins/tpm/ ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi

if [ ! -d ~/.config/tmux/plugins/tmux-resurrect/ ]; then
	git clone git@github.com:tmux-plugins/tmux-resurrect.git  ~/.config/tmux/plugins/tpm
fi
git config --global user.email "abdulmohsen.jawad.almajed@gmail.com"
git config --global user.name "ssda"
mv .gitconfig ~/
