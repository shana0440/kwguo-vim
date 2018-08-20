#!/bin/bash

app_name=".kwguo-vim"

success() {
	if [ "$res" -eq "0" ]; then
		echo $1
	else
		exit 1
	fi
}

backup() {
	backup_target=$HOME/.vimrc
	# if backup_target exists
	if [ -e "$backup_target" ]; then
		backup_path=$HOME/.backup-vim
		mkdir -p $backup_path
		mv $HOME/.vimrc $backup_path
		res="$?"
		success "~/.vimrc already backup to ${backup_path}."
	fi
}

install_vim_plug() {
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	res="$?"
	success "installed vim-plug"
}

sync_repo() {
	repo_path=$HOME/$app_name
	if [ ! -e "$repo_path" ]; then
		git clone https://github.com/shana0440/kwguo-vim.git $repo_path
		res="$?"
		success "clone kwguo-vim success."
	else
		cd $repo_path && git pull origin master
		res="$?"
		success "update kwguo-vim success."
	fi
}

create_symlinks() {
	repo_path=$HOME/$app_name
	ln -sf "$repo_path/.vimrc"         "$HOME/.vimrc"
	ln -sf "$repo_path/.vimrc.bundles" "$HOME/.vimrc.bundles"
	touch "$HOME/.vimrc.local"
	touch "$HOME/.vimrc.bundles.local"
	mkdir -p $HOME/.vim/undodir
	res="$?"
	success "setting up vim sumlinks."
}

get_os() {
	if [ "`uname`" = "Darwin" ]; then
		os="OSX"
	else
		os=`cat /etc/os-release | grep -i "NAME=" | cut -d '=' -f2 | head -1 | sed 's/"//g' | cut -d ' ' -f1`
	fi
}

install_dependency() {
	get_os
	echo "Current OS is $os"
	if [ "$os" = "OSX" ]; then
		brew update && brew install the_silver_searcher git
		if [ $? -ne 0 ]; then
			brew upgrade the_silver_searcher git
		fi
	elif [ "$os" = "Ubuntu" ]; then
		sudo apt update -y && sudo apt install -y silversearcher-ag git
	elif [ "$os" = "CentOS" ]; then
		sudo yum update -y && sudo yum install -y the_silver_searcher git
	fi
	res="$?"
	success "installed dependency"
}

setup_plug() {
	vim -u $HOME/.vimrc.bundles \
		"+PlugInstall" \
		"+PlugClean" \
		"+qall"
	res="$?"
	success "installed plugins"
}

download_languageTool() {
	wget -O tmp.zip https://www.languagetool.org/download/LanguageTool-4.1.zip
	unzip tmp.zip
	mkdir -p ~/.vim/plugged/vim-grammarous
	mv LanguageTool-4.1 ~/.vim/plugged/vim-grammarous/misc
	rm -rf tmp.zip LanguageTool-4.1
}

backup
install_dependency
install_vim_plug
sync_repo
create_symlinks
setup_plug
download_languageTool

echo "Thanks for you install $app_name"
