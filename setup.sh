#!/bin/bash


install_missing='false'

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
	if command -v $1 &> /dev/null ; then
		echo "$1 present"
		return 0
	elif $install_missing ; then
		case $1 in 
			*"${pacmans[@]}"*)
				install_pacman_package $1
				;;
			*"${yays[@]}"*)
				install_yay_package $1
				;;
			*"${from_sources[@]}"*)
				eval install_$1
				;;
		esac
	else 
		echo "$1 is not installed, use -i | --install-if-missing to automatically install missing dependecies"
	fi
}

function install_yay () {
	echo "installing yay from source"
	check_command git
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	echo "I'll need elevated permissions to delete the yay repo"
	sudo rm -r yay/
}

function install_IoTuring () {
	#add to pipxs
	check_command pipx
	pipx install IoTuring
}

function install_pacman_package () {
	#TODO implement sudo for pacman
	echo "installing pacman package will need sudo"
	#sudo -s package=$1 << 
    	"pacman -Syu --needed $package"
	#'YOOOO'
	#sudo -k
}

function print_usage() {
	echo "TODO"
}

from_sources=("yay" "IoTuring")
declare -a yays
readarray -t yays < "yay_list.txt"
declare -a pacmans
readarray -t pacmans < "pacman_list.txt"


function install_all () {
	for package in ${pacmans[@]}; do
		install_pacman_package $package
	done
	check_command yay
	for package in ${yays[@]}; do
		install_yay_package $package
	done
	for package in ${from_source[@]}; do
		eval install_$1
	done
}

while test $# -gt 0; do
  case "$1" in
    -i | --install-if-missing) 
	install_missing='true' 
	;;
	-a | --all)
	install_all
	;;
    *) 
	print_usage
    exit 1
	;;
  esac
done



#check_ssh_keys_present
#check_command git
#check_command yay
#check_command curl
#check command python
#check command pip
#check_command topgrade
#check_command IoTuring
#install_rust
#check_github_auth




