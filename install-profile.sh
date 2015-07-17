#!/bin/sh
cd ..
ln -s .profile/bashrc_user .bashrc_user
echo "
if [ -f ~/.bashrc_user ]; then
    . ~/.bashrc_user
fi
" >> .bashrc
source ~/.bashrc
