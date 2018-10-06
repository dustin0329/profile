#!/bin/sh
cd ..
ln -s .profile_user/bashrc_user .bashrc_user
echo "
if [ -f ~/.bashrc_user ]; then
    . ~/.bashrc_user
fi
" >> .bashrc

cd
ln -s .profile_user/.screenrc .screenrc

