
# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install vimrc configuration
cp .vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/colors
cp colors/* $HOME/.vim/colors/
mkdir -p $HOME/.config/mypy
cp mypy.config $HOME/.config/mypy 
mkdir -p $HOME/.vim/templates
cp templates/* $HOME/.vim/templates

# Install nice fonts for vim-airline
sudo apt install -y fonts-powerline

# NOTE: At this point you should open vim and run PluginInstall then after this
# you can compile youcompleteme
