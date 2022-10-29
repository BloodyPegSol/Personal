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
alias lumerical="/opt/lumerical/v222/bin/launcher"
alias estadosolido=" cd /home/juancarrizales/Documents/TEC/5S/1P/Estado_Solido"
alias fotonico="cd /home/juancarrizales/Documents/TEC/5S/1P/Sistemas_Fotonicos"
alias nanof="cd /home/juancarrizales/Documents/TEC/5S/2P/Nanofluídica"
alias torb="/opt/tor-browser_en-US/start-tor-browser.desktop"
alias datawarrior="/opt/datawarrior/datawarrior"
alias pcloud="/opt/pcloud_/pcloud"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."


#Useful commands

function rcc(){
	gcc -o run.exe $1; ./run.exe; rm run.exe
}
