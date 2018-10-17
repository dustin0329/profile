#!/bin/sh
cd
ln -s github_profile_user/bashrc_user .bashrc_user
echo "
if [ -f ~/.bashrc_user ]; then
    . ~/.bashrc_user
fi
" >> .bashrc

cd
ln -s github_profile_user/vimrc .vimrc
ln -s github_profile_user/vim .vim
ln -s github_profile_user/screenrc .screenrc

