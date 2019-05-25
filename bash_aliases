alias ?='man'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias cls='clear'
alias cp='cp -i'
alias dir='ls'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ipconfig='ifconfig'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto -F'
alias mv='mv -i'
alias please='sudo !!'
alias rm='rm -i'
alias root='sudo -i'
alias sanctuaryserverconnect='mosh michel@24.101.102.48:2022 -- tmux new -A -s Main'
alias serveit='python -m SimpleHTTPServer 8000'
alias showalias='cat $HOME/.bash_aliases'
alias speedtest='speedtest-cli'
alias sudo='sudo '
alias untar='\tar zxvf'
alias update='sudo apt-get update ; sudo apt-get upgrade -y ; sudo apt-get autoremove'
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias wget='wget -c '
alias remount='sudo mount /dev/sdc1 /media/Buster ; sudo mount /dev/sda1 /media/LSM'
alias search='set -f;search';search() { find . ${2:+-name "$2"} -type f -print0 | xargs -0 grep --color=auto "$1"; }
alias killmux='tmux kill-session'
alias gitShove='git add . && git commit -a && git push -u origin --all'
alias gitYank='git pull'
alias updateAlias='cp ~/Repositories/Dotfiles/bash_aliases ~/.bash_aliases && . ~/.bash_aliases && echo "Aliases Updated!!"'
alias startuTorrent='utserver -settingspath /opt/utorrent-server-alpha-v3_3/ &'
