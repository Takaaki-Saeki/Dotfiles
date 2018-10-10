DOT_FILES=(.bashrc .bash_profile .vim .vimrc .tmux.conf)

 for file in ${DOT_FILES[@]}
 do
     ln -s $HOME/Documents/dotfiles/$file $HOME/$file
 done
