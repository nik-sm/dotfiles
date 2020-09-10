" Place in ~/.vim/ftplugin/python.vim
let g:ale_virtualenv_dir_names = [ $HOME . "/py37" ]

let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['yapf', 'isort', 'remove_trailing_lines', 'trim_whitespace']
