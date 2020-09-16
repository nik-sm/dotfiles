# undo directory
mkdir -p ~/.vim/undodir
cp .vimrc ~/

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle 
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install plugins
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/dense-analysis/ale.git ~/.vim/bundle/ale
git clone https://github.com/JuliaEditorSupport/julia-vim.git ~/.vim/bundle/julia-vim
## Golang - See https://github.com/fatih/vim-go for install instructions
# git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

# setup default python virtualenv for ALE
# NOTE - path to this env is referenced in python.vim
python3 -m virtualenv ~/venv
source ~/venv/bin/activate
pip install yapf flake8 isort pylint
deactivate

# python ALE settings
mkdir -p ~/.vim/ftplugin
cp python.vim ~/.vim/ftplugin
mkdir -p ~/.config/yapf
cp yapf-style ~/.config/yapf/style
