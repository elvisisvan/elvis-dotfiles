# .aliases

#alias ??='echo $?'

alias as='apt search'
alias al='apt list --installed'
alias ai='apt show'
alias ain='sudo apt install'
alias aun='sudo apt remove'
alias aup='sudo apt update'
alias aupg='sudo apt upgrade'
alias aauto='sudo apt autopurge'
alias agrep='apt list --installed | grep'

alias cf=cpufetch
alias cr=clear
alias catgroup='cat /etc/group'
alias catgroupnum='cat /etc/group | wc -l'
alias cent='wine /run/media/elvis/Elvis-Windows/Users/Elvis/CentBrowserPortable/cent.exe'
alias cursor='/opt/cursor.appimage'
alias countpath='tr ":" "\n" <<< "$PATH" | nl'
alias dautoremove='sudo dnf autoremove'
alias ds='dnf search'
alias di='dnf info'
alias din='sudo dnf install'
alias dun='sudo dnf remove'
alias dup='sudo dnf update --exclude=spectacle'
alias ddup='dnf --showduplicates list'
alias dlist='dnf list installed'
alias dgrep='dnf list installed | grep'
alias dq='dnf5 repoquery'
alias defaultbrowser='xdg-settings get default-web-browser'
alias defaultbrave='xdg-settings set default-web-browser brave-browser.desktop'
alias defaultvivaldi='xdg-settings set default-web-browser vivaldi-stable.desktop'
alias defaultedge='xdg-settings set default-web-browser microsoft-edge.desktop'
alias defaultfirefox='xdg-settings set default-web-browser firefox.desktop'
alias dusize='sudo du -sh'
alias e=exit
alias echopath='echo $PATH | tr ":" "\n" | sort | nl'

alias ff=fastfetch
alias fp='flatpak'
alias fpl='flatpak list'
alias fps='flatpak search'
alias fpi='flatpak search'
alias fpin='flatpak install'
alias fpun='flatpak remove'
alias fpup='flatpak update'
alias fpspotify='fp run com.spotify.Client'
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
alias gitl1='git log --all --oneline --graph'
alias gengrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias gengrub2='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'
alias hf=hyfetch
alias lampp='sudo /opt/lampp/lampp 2>/dev/null'
alias lg=lazygit
alias lsl='ls -lAh --color=auto'
alias lsa='ls -lahHLRZv --full-time --color=auto'
alias le="eza --no-filesize --no-user --long --color=always --icons=always"
alias ledir='eza -lA --no-filesize --no-user --no-permissions --group-directories-first --color=always --icons=never'
alias l='lsd -lA --header'
alias ll='lsd -lAZL --header --icon-theme=unicode'
alias lgit='lsd -lAGg --header'
alias ldir='lsd -la --header --group-directories-first'
alias lsize='sudo lsd -lASr --header --total-size'
alias ltime='lsd -lAtr --header'
alias lsoflisten='lsof -i -P -n | grep LISTEN'
alias logout='loginctl kill-session $XDG_SESSION_ID'
alias killadb='adb kill-server'
alias myip='curl ipinfo.io/json'
alias myipp='curl ipapi.co/json'
alias mountfedora='sudo ~/Documents/mountfedora40.sh'
alias netstatlisten="sudo netstat -tulpn | grep -E ':(80|443|[0-9]{1,3})' | grep LISTEN"
alias norda='nordvpn account'
alias nordtw='nordvpn c taiwan'
alias nordus='nordvpn c us'
alias nordsf='nordvpn c us san_francisco'
alias nordca='nordvpn c canada'
alias nordc='nordvpn c'
alias nordd='nordvpn d'
alias nords='nordvpn status'
alias nordset='nordvpn settings'
alias nordin='nordvpn login'
alias nordout='nordvpn logout'
alias nordp='nordvpn set protocol'
alias nordtech='nordvpn set technology'
alias ns='nala search'
alias ni='nala show'
alias nin='nala install'
alias nun='nala remove'
alias nup='nala update'
alias nupg='nala upgrade'
alias ngrep='nala list --installed | grep'
alias nf=neofetch
alias psu='ps -ef -u'
alias psgrep='ps -ef | grep'
alias pingc5='ping -c 5'
alias pingc10='ping -c 10'
alias pi='pacman -Sii'
alias pin='sudo pacman -S --needed'
alias pun='sudo pacman -Rns'
alias pup='sudo pacman -Syu'
alias pfl='pacman -Fl'
alias pl='pacman -Q'
alias ple='pacman -Qe'
alias plm='pacman -Qm'
alias pln='pacman -Qn'
alias pss='pacman -Ss'
alias pclean='sudo pacman -Sc'
alias pgrep='pacman -Qs'
alias pqi='pacman -Qii'
alias porphaned='pacman -Qdt'
alias power='upower -d'
alias potplayer="wine ~/linux-downloads/PotPlayerPortable64/PotPlayerPortable.exe &"
alias qb=qbittorrent
alias osrelease='cat /etc/os-release'
alias of=onefetch
alias rfrs='exec $SHELL -l'
alias release='lsb_release -a'
alias session='echo $XDG_SESSION_TYPE'
alias sessionid='echo $XDG_SESSION_ID'

alias shutdownnow='shutdown -h now'
alias scdis='systemctl disable'
alias scen='systemctl enable'
alias scstart='systemctl start'
alias scstop='systemctl stop'
alias scs='systemctl status'
alias screload='systemctl daemon-reload'
alias screstart='systemctl restart'
alias sdif='sudo snapper diff'
alias sdel='sudo snapper delete'
alias sl='snapper ls --disable-used-space'
alias sll='snapper ls'
alias slh='snapper -c home ls'
alias sundo='sudo snapper undochange'
alias sst='snapper status'
alias ssth='snapper -c home status'
alias sslisten="sudo ss -tulpn | grep -E ':(80|443|[0-9]{1,3})' | grep LISTEN"
alias st='speedtest'
alias starttor='/opt/tor-browser/start-tor-browser.desktop'
alias startdocker='systemctl start docker containerd'
alias stopdocker='systemctl stop docker containerd'
alias stopkdec='kill $(ps aux | grep "[k]deconnectd" | awk "{print $2}")'
alias si='inxi -F'
alias tp='trash-put -iv'
alias vencord='sudo ~/linux-downloads/VencordInstaller'
alias vram='free -h && swapon --show && zramctl --output-all'
alias xamppmanager='sudo /opt/lampp/manager-linux-x64.run'
alias yss='yay -Ss'
alias yi='yay -Sii'
alias yin='yay -S'

testexist() {
    if [ -e "$1" ]; then
        echo "Exists"
    else
        echo "Does not exist"
    fi
}

vncstart() {
  Xvfb :0 -screen 0 1440x900x24 -nolisten tcp &
  sleep 1
  DISPLAY=:0 setsid startlxqt >/dev/null 2>&1 &
  sleep 2
  x11vnc -display :0 -rfbauth ~/.vnc/passwd -forever -shared -bg -noipv6 -noshm
}

ffr() {
    cd ~/fakeroot-*
    ./bootstrap
    ./configure --prefix=/opt/fakeroot --libdir=/opt/fakeroot/libs --disable-static --with-ipc=tcp
    make
    sudo make install
    export PATH="/opt/fakeroot/bin:$PATH"
    cd
}

