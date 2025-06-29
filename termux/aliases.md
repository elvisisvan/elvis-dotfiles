# termux .aliases

#alias ??='echo $?'
alias as='apt search'
alias ai='apt show'
alias ain='apt install'
alias aun='apt remove'
alias aup='apt update'
alias aupg='apt upgrade'
alias agrep='apt list --installed | grep'
alias cdinstalledproot='cd ~/../usr/var/lib/proot-distro/installed-rootfs'
alias cf=cpufetch
alias cr=clear
alias crarch='chroot /data/local/linux-elvis /bin/bash -c "su - elvis"'
alias checkmount='mount | grep /data/local/linux-elvis'
alias dusize='sudo du -sh'
alias dcrm='sh ~/src-elvis/elvis-dotfiles/termux/disable-chrome.sh'
alias ecrm='sh ~/src-elvis/elvis-dotfiles/termux/enable-chrome.sh'
alias dyt='sh ~/src-elvis/elvis-dotfiles/termux/disable-youtube.sh'
alias eyt='sh ~/src-elvis/elvis-dotfiles/termux/enable-youtube.sh'
alias echopath='echo $PATH | tr ":" "\n"'
alias e=exit

alias ff=fastfetch
alias gitl1='git log -a --oneline --decorate --graph'
alias gs='git status'
alias gst='git stash push'
alias glist='git stash list'
alias gpop='git stash pop'
alias gitbackup='git add . && git commit'
alias gitb='git branch -a | bat'
alias gitf='git fetch -vp'
alias gitl='git log --summary --graph --full-history'
alias gitp='git pull -vp'
alias gits='git switch'
alias gitstat='du -sh .git && du -sh . && git count-objects -vH && git-sizer -vv'
alias lg='lazygit'
alias ls='ls --color=auto'
alias lsl='ls -lAh --color=auto'
alias lsa='ls -lahHLRZv --full-time --color=auto'
alias le='eza -lA --no-filesize --no-user --color=always --icons=never'
alias ledir='eza -lA --no-filesize --no-user --no-permissions --group-directories-first --color=always --icons=never'
alias l='lsd -lA --header --icon-theme=unicode'
alias ll='lsd -laZL --header --icon-theme=unicode'
alias lgit='lsd -lAgG --header --icon-theme=unicode'
alias ldir='lsd -la --header --group-directories-first --icon-theme=unicode'
alias lsize='lsd -lASr --header --total-size --icon-theme=unicode'
alias ltime='lsd -lAtr --header --icon-theme=unicode'
alias lsoflisten='sudo lsof -i -P -n | grep LISTEN'
alias logout='qdbus org.kde.ksmserver /KSMServer logout 0 0 0'
alias myip='curl ipinfo.io'
alias myipp='curl https://ipapi.co/json'
alias netstatlisten='sudo netstat -tuln | grep LISTEN'
alias ns='nala search'
alias ni='nala show'
alias nin='nala install'
alias nun='nala remove'
alias nup='nala update'
alias nupg='nala upgrade'
alias nlupg='nala list --upgradable'
alias ngrep='nala list --installed | grep'
alias nf=neofetch
alias of=onefetch
alias pkgs='pkg search'
alias pkgi='pkg show -a'
alias pkgin='pkg install'
alias pkgun='pkg uninstall'
alias pkgup='pkg update'
alias pkgupg='pkg upgrade'
alias pkggrep='pkg list-installed | grep'
alias pingc5='ping -c 5'
alias pingc10='ping -c 10'
alias power='upower -d'
alias psu='ps -ef -u'
alias psgrep='ps -ef | grep'
alias qb=qbittorrent
alias osrelease='cat /etc/os-release'
alias release='lsb_release -a'
alias rfrs='exec $SHELL -l'
alias session='echo $XDG_SESSION_TYPE'

alias shutdownnow='shutdown -h now'
alias st='termux-chroot ~/ookla-speedtest-1.2.0-linux-aarch64/speedtest --ca-certificate=$PREFIX/etc/tls/cert.pem'
alias suesu="sudo -E su -c 'bash --rcfile /data/data/com.termux/files/home/.aliases -i'"
alias suchroot='sudo -E su -c termux-chroot'
alias tp='trash-put -v'

findwp() {
	local path=${2:-.} # use second args as path, default to current dir
	sudo find '$path' -iname '*$1*'
}

mountarch() {
    mount -t proc /proc /data/local/linux-elvis/proc
    mount --make-rshared --rbind /sys /data/local/linux-elvis/sys
    mount --rbind /dev /data/local/linux-elvis/dev
    mount --rbind /dev/pts /data/local/linux-elvis/dev/pts
    mkdir /data/local/linux-elvis/dev/shm
    mount -t tmpfs shm /data/local/linux-elvis/dev/shm -o size=256M
    mount -o remount,suid /data
}


