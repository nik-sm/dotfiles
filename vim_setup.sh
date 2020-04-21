# Undo directory
mkdir -p ~/.vim/undodir

# Plugins
## Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle 
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree

# See https://github.com/fatih/vim-go for install instructions
#git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
