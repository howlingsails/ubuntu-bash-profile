#!/bin/bash
#


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi


PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH


source ~/.bash_aliases
# TODO: Update your timezone
export TZ=America/Los_Angeles
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre


# Define IP address of box
THEIP_TMP=$(ifconfig  | grep 'inet ' | head -n2 | grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $2","}')
THEIP=`echo -e  "[ ${THEIP_TMP//[$'\t\r\n']} ]"`

# Add Prompt for Git/Mercural/Subversion branch info
source ~/.bash_prompt
PROMPT_COMMAND=set_bash_prompt

sshsystems=`cat ~/.bash_systems | grep alias| awk '{print $2}' | sehind "s/='ssh//" | sort | xargs -s 140`
usefulCommands=`cat ~/.bash_commands | grep "alias\|function"| sed "s/=/ /" | awk '{print $2}' | sed  "s/=\"cat//" | sed "s/='clear;//" | sed "s/='//" | sed "s/=\"//" | sed "s/;//" | sed "s/()//" | sort | xargs -s 140`
source ~/.bash_systems
source ~/.bash_commands


clear

echo -e "${BBlue}"
echo -e "${Blue} __   __  _______  _     _  ___      ___   __    _  _______      ";
echo -e "${Blue}|  | |  ||       || | _ | ||   |    |   | |  |  | ||       |     ";
echo -e "${Blue}|  |_|  ||  ${BWhite} _ ${Blue}  || || || ||   |    |   | |   |_| ||    ___|     ";
echo -e "${Blue}|       ||  ${BWhite}| |${Blue}  ||       ||   |    |   | |       ||   | __      ";
echo -e "${Blue}|       ||  ${BWhite}|_|${Blue}  ||       ||   |___ |   | |  _    ||   ||  |     ";
echo -e "${Blue}|   _   ||       ||   _   ||       ||   | | | |   ||   |_| |     ";
echo -e "${Blue}|__| |__||_______||__| |__||_______||___| |_|  |__||_______|     ";
echo -e "${Blue}                        _______  _______  ___   ___      _______ ";
echo -e "${Blue}                       |       ||  ${BGreen} _ ${Blue}  ||   | |   |    |       |";
echo -e "${Blue}               ____    |  _____||  ${BGreen}|_|${Blue}  ||   | |   |    |  _____|";
echo -e "${Blue}              |____|   | |_____ |       ||   | |   |    | |_____ ";
echo -e "${Blue}                       |_____  ||       ||   | |   |___ |_____  |";
echo -e "${Blue}                        _____| ||   _   ||   | |       | _____| |";
echo -e "${Blue}                       |_______||__| |__||___| |_______||_______|";
echo -e "${Blue}"
echo -e "${Green}Useful Command:${BWhite} .2 .3 .4, c  src ${BBlue}(reload this), ${BWhite}bsh ${BBlue}(edit this)"
echo -e "${BYellow}${usefulCommands} "
echo ""
echo -e "${Green}Connect To Remote System:${BWhite}"
echo -e "${BYellow}${sshsystems} "
echo ""

LS_COLORS='di=1;36:ln=35:so=32:pi=33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export LS_COLORS

alias sshkey='cat ~/.ssh/id_rsa.pub'
alias bsh='vim ~/.bash_profile'
alias src='source ~/.bash_profile'
alias sssh='ssh -i ~/.ssh/id_rsa'
# Use SSH with id_rsa file

cd() { builtin cd "$@"; ls -Cp --color; }              
alias ls='ls -Ca --color'			   
alias mv='mv -iv'                           
alias mkdir='mkdir -pv'                     
alias ll='ls -FClAhp'                       
# Always list directory contents upon 'cd'

alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .2='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

alias ~="cd ~"                              
# ~:            Go Home

alias c='clear'                             
# c:            Clear #terminal display

alias which='type -all'                     
# which:        Find #executables

alias path='echo -e ${PATH//:/\\n}'         
# path:         Echo all #executable Paths

alias show_options='shopt'                  
# Show_options: display #bash options settings

alias fix_stty='stty sane'                  
# fix_stty:     Restore #terminal settings when screwed up

alias cic='set completion-ignore-case On'   
# cic:          Make #tab-completion case-insensitive

