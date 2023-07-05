# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc 

#Auto-lanzamiento ssh-agent

env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env


#Some variable for frequently used directories

alias lp.="cd /home/juancarrizales/Documents/LATEX\ PROJECTS"
alias estadosolido=" cd /home/juancarrizales/Documents/TEC/5S/1P/Estado_Solido"
alias torb="cd /opt/tor-browser_en-US/; ./start-tor-browser.desktop; cd"
alias pcloud="/opt/pcloud_/pcloud"
alias yb="cd ~/YOCTO/poky/build"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias c="clear"

#Useful commands

#RAPID C/C++ COMPILATION
#
function rcc(){
	if [[ $1 == *.c ]]
	then
		gcc -Wall -Wshadow -o run.exe $1; ./run.exe ${@:2}; rm run.exe
        elif [[ $1 == *.cpp ]]
	then
		g++ -o run.exe $@; ./run.exe ${@:2}; rm run.exe
	else
		echo "Argument must be .cpp or .c"
	fi
}

#RAPID NASM COMPILATION
#
function rnasm(){
	if [[ $1 == *.asm ]]
	then
		nasm -f elf64 $1 -o exe.o; ld exe.o -o run.exe; ./run.exe ${@:2}; rm run.exe
	fi
}	




#Setting up ORCA
#export PATH="$HOME/orca:$PATH"; export LD_LIBRARY_PATH="$HOME/orca:$LD_LIBRARY_PATH"

#Setting up SINGULAR
 export path=$HOME/PERSONAL/SINGULAR/install/bin/:$PATH
 
 PS1="\e[1;36m[[\e[m\e[1;35m\u@\h\e[m \e[1;31m\W\e[m\e[1;36m]]\e[m\n\e[5;32m<?>\e[m$ "
