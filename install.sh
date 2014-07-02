#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
#origin http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

######################

# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#function cmake_install {
#  if [[ `uname -s` == "Darwin" ]]; then
#    homebrew_cmake_install
#  else
#    linux_cmake_install
#  fi
#}
#
#if [ "$(which scala | wc -l)" -ne "0" ]
#  then
#    echo "Ok, alles in Ordnung."
#  else
#    echo "Ahrg...Fehler."
#fi

# Date Time Stamp
dts() { date +%Y-%m-%d-%H-%M-%S; }

install_stuff(){
	
	########## Variables
	SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	#dir=~/dotfiles                    # dotfiles directory
	dir=$SCRIPT_DIR
	olddir=~/dotfiles_old             # old dotfiles backup directory
	files="vimrc zshrc zsh bin tmuxconf"    # list of files/folders to symlink in homedir
	
	##########
	
	# create dotfiles_old in homedir
	echo "Creating $olddir for backup of any existing dotfiles in ~"
	echo "########################################"

	mkdir -p $olddir
	echo "...done"
	echo ""
	
	# change to the dotfiles directory
	echo "Changing to the $dir directory"
	echo "########################################"

	cd $dir
	echo "...done"
	echo ""
	
	# make shellscripts executable
	echo "Make files in $dir/bin executable"
	echo "########################################"

	for file in $(ls $dir/bin/); do
		exeFile=$dir/bin/$file
		echo "make $exeFile executable"
		chmod +x $exeFile
	done
	echo ""
	
	# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
	echo "Moving any existing dotfiles from ~ to $olddir"
	echo "########################################"
	for file in $files; do
		checkpath=~/.$file
		if [ -e $checkpath ];
		then
			echo "$file already exists"
			newOldPath=$(dts)
			mkdir -p ~/dotfiles_old/$newOldPath
	    	mv ~/.$file ~/dotfiles_old/$newOldPath/$file
	    else
			echo "File $fILE does not exists"
	    fi
	    echo "Copy $file in home directory."
	    cp -r $dir/$file ~/.$file
	    echo ""
	done
	
	# create folder for coding
	echo "create folder ~/code and ~/code/go/"
	echo "########################################"
	mkdir -p ~/code/go/bin
	echo "~/code/go is linked to GOPATH by zsh and PATH is part of ~/code/go/bin"
	echo ""

	# 
	# Source stuff
	sourceTarget="bashrc zshrc"
	for target in $sourceTarget; do
		echo "source ~/dotfiles/pathStuff" >> ~/.$target
	done
	
	#### vim stuff
	# get vim-go
	echo "do some magic vim stuff"
	echo "there will be some problem with the colors"
	echo "########################################"

	mkdir -p ~/.vim/bundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	echo "########################################"
#	echo "Do sh ~/.vim/bundle/YouCompleteMe/install.sh"
#	echo "########################################"

}

while true; do
    read -p "Have you installed stuff like 'build-essential vim cmake python-dev golang git mercurial tmux'???[Y/N]" yn
    case $yn in
        [Yy]* ) install_stuff; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
