#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
#origin http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc zshrc zsh bin"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"
echo ""

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"
echo ""

# make shellscripts executable
echo "Make files in $dir/bin executable"
for file in $(ls $dir/bin/); do
	exeFile=$dir/bin/$file
	echo "make $exeFile executable"
	chmod +x $exeFile
done
echo ""

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
    echo ""
done

# create folder for coding
echo "create folder ~/code and ~/code/go/"
mkdir -p ~/code/go/bin
echo "~/code/go is linked to GOPATH by zsh and PATH is part of ~/code/go/bin"
echo ""
