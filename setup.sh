#!/bin/bash
set -e

function check_ssh_keys_present() {
	
	echo "testing for any ssh key"


	sshkeys=$HOME/.ssh/id_*

	for element in $sshkeys; do
		echo $element
		if [[ $element =~ "id_" ]]; then
			echo "some ssh key is here, continue"
			break
		fi
	done
	
}

function check_ssh_agent_running() {
	#TODO
	#mapfile -t out < <( ssh-agent )
	#echo $out[3]
	echo "todo check ssh-agent"
	return 0
}

function check_github_auth() {
	echo "checking github ssh auth, you may need to input your ssh-key passphrase"
	if ! check_ssh_agent_running; then 
		exit
	fi
	# Attempt to ssh to GitHub
	ssh -T git@github.com &>/dev/null
	RET=$?
	if [ $RET == 1 ]; then
		# user is authenticated, but fails to open a shell with GitHub
		return 0
	elif [ $RET == 255 ]; then
		# user is not authenticated
		return 1
	else
		echo "unknown exit code in attempt to ssh into git@github.com"
	fi
	return 2
}

function check_command () {
	# check if in bin but could also be in another directory on path, check if executable
	if [ -x "/usr/bin/$1" ]; then
		echo "git present"
		return 0
	elif $2 == "--install-if-missing"
		echo "installing $1"
		eval install_$1
		return 1
	else 
		echo "$1 is missing in your bin "
	fi
}

function install_yay () {
	check_command git
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	sudo rm -r yay/

}
function install_git () {
	pacman -S --needed git base-devel
}

function install_rust () {
	check_command cargo
	check_command curl
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	cargo install topgrade
}

#check_ssh_keys_present
#check_command git
#check_command yay
#check_command curl
install_rust
#check_github_auth




