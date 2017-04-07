# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cls=clear
alias wifirate='sudo iwconfig wlan0 rate 54M'
# alias lockhpu 'ssh -X howard@192.168.0.106 "export DISPLAY=:0; gnome-screensaver; gnome-screensaver-command -l;"'
# alias unlockhpu 'ssh -X howard@192.168.0.106 "export DISPLAY=:0; gnome-screensaver; gnome-screensaver-command -d;"'

alias java8='sudo update-java-alternatives -s java-8-oracle'
alias java7='sudo update-java-alternatives -s java-7-oracle'
alias javaopen='sudo update-java-alternatives -s java-1.7.0-openjdk-amd64'

alias sublime='/opt/sublime_text/sublime_text'
alias hgfs='sudo vmware-config-tools.pl -d --clobber-kernel-modules=vmhgfs'



export gwguest1='172.20.10.1'
export gwguest2='10.1.10.1'
export gwharris='192.168.37.2'

alias noharris='sudo route del default gw "$gwharris"'

alias tw0gw='sudo route add 	-net 34.194.132.0		netmask 255.255.255.0	gw "$gwguest1"'
alias tw1gw='sudo route add 	-net 52.202.168.0		netmask 255.255.255.0	gw "$gwguest1"'
alias tw2gw='sudo route add 	-net 52.24.196.0		netmask 255.255.255.0	gw "$gwguest1"'
alias tw3gw='sudo route add 	-net 52.192.206.0		netmask 255.255.255.0	gw "$gwguest1"'
alias tw4gw='sudo route add 	-net 23.23.0.0			netmask 255.255.0.0	gw "$gwguest1"'
alias tw5gw='sudo route add 	-net 23.21.250.0		netmask 255.255.255.0	gw "$gwguest1"'

alias ttgw='sudo  route add 	-net 184.73.251.0		netmask 255.255.255.0	gw "$gwguest1"'
alias ttvlcgw='sudo  route add 	-net 107.23.117.0		netmask 255.255.255.0	gw "$gwharris"'
 
alias tosgw='sudo route add 	-net 216.105.249.0 		netmask 255.255.255.0 	gw "$gwharris"'

# gmail gateway alias
alias gmailgw='sudo  route add -net 216.58.219.0 	netmask 255.255.255.0 gw 172.20.10.1'
alias gdrivegw='sudo route add -net 74.125.138.0 	netmask 255.255.255.0 gw 172.20.10.1'
# show connections
alias myconnect='netstat -Wp | grep -v "localhost" | grep -v "127.0.0.1" | grep -i est | sort'
alias myconn='netstat -WpN   | grep -v "localhost" | grep -v "127.0.0.1" | grep -i est | sort'
alias showconn='while $1; do clear; myconnect; sleep 5; done'

alias netmgr='sudo  systemctl restart NetworkManager.service'
alias netmgrs='sudo service network-manager restart' #  NetworkManager.service

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export PATH=$PATH:/home/howard/bin;
export PATH=$PATH:/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64;

#GNUSTEP Environment vars
#. /usr/share/GNUstep/Makefiles/GNUstep.sh

xhost +

alias vivado='/opt/Xilinx/Vivado/2012.3/bin/vivado &'
alias xps='/opt/Xilinx/14.7/ISE_DS/EDK/bin/lin64/xps &'
alias ise='/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/ise &'
alias coregen='/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/coregen &'

#
export XILINX_EDK=/opt/Xilinx/14.7/ISE_DS/EDK
source /opt/Xilinx/14.7/ISE_DS/settings64.sh

export XILINX_PLATFORM=lin64
export LD_LIBRARY_PATH=/usr/local/MATLAB/MATLAB_Runtime/v85/runtime/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v85/bin/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v85/sys/os/glnxa64

# added by Anaconda2 2.4.1 installer
export PATH="/home/trader/anaconda2/bin:$PATH"

# added by Anaconda3 2.4.1 installer
export PATH="/home/trader/anaconda3/bin:$PATH"
