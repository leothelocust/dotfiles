#!/bin/bash

######################################
# init.sh
# ---------
# Symlink ~/dotfiles to $HOME
######################################

dir=~/dotfiles                       # dotfiles directory
backup=~/dotfiles_backup             # old dotfiles backup directory
symfiles=".aliases .bash_profile .bash_prompt .bashrc .dockerfunc .exports .functions .path .xinitrc .Xresources .Xdefaults .xmodmap"
symdefaults=".extra"                 # not in version control

######################################

# create dotfiles_old in homedir
echo "Creating $backup to backup of any existing dotfiles already in ~/"
mkdir -p $backup
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $symfiles; do
    echo "Moving any existing dotfiles from ~/ to $backup"
    mv ~/$file $backup/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
echo "...done"

# create any template/default files not in version control
for file in $symdefaults; do
    echo "Creating empty file $file in home directory."
    touch $dir/$file
    echo "#!/bin/bash\n\n##############################\n# $file\n# ---------------\n##############################\n\n" > $dir/$file
done
echo "...done"

# https://doc-08-0g-docs.googleusercontent.com/docs/securesc/3m7t6hq95j05qojlngekkd8c5obrjfk4/5c0eggqhge779o6kn2oe4dqsgprd16jm/1519423200000/08124755567902560828/08124755567902560828/1oZzZ8UdoqmR6KsZLdmyxjYUUTpLVxMip?e=download&nonce=vqoqalqs6bnai&user=08124
