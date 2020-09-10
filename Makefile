setup-all: setup-zsh setup-vim setup-tools
	bash setup-all.sh

setup-zsh: setup-zsh.sh
	bash setup-zsh.sh

setup-vim: setup-vim.sh
	bash setup-vim.sh

setup-tools: setup-tools.sh
	bash setup-tools.sh
