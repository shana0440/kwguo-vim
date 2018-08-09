#!/bin/bash

success() {
	if [ "$res" -eq "0" ]; then
		echo $1
	fi
}

backup() {
	backup_path=$HOME/.backup-vim
	mkdir -p $backup_path
	mv $HOME/.vimrc $backup_path
	res="$?"
	success "~/.vimrc already backup to ${backup_path}."
}

install_vim_plug() {
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

sync_repo() {
	repo_path=$HOME/.kwguo-vim
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
	repo_path=$HOME/.kwguo-vim
	ln -sf "$repo_path/.vimrc"         "$HOME/.vimrc"
	ln -sf "$repo_path/.vimrc.bundles" "$HOME/.vimrc.bundles"
	touch "$HOME/.vimrc.local"
	mkdir -p $HOME/.vim/undodir
	res="$?"
	success "setting up vim sumlinks."
}

install_dependency() {
	if [ "`uname`" = "Darwin" ]; then
		brew update && brew install the_silver_searcher git
	else
		distrib=`cat /etc/lsb-release | grep -i DISTRIB_ID | cut -d '=' -f2`
		if [ "$distrib" = "Ubuntu" ]; then
			sudo apt update && sudo apt install -y silversearcher-ag git
		fi
	fi
}

setup_plug() {
	vim -u $HOME/.vimrc.bundles \
		"+PlugInstall" \
		"+PlugClean" \
		"+qall"
}

backup
install_dependency
install_vim_plug
sync_repo
create_symlinks
setup_plug

echo "Thanks for you install"
