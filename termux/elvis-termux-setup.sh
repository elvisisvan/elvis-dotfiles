termux-setup-storage
ln -siv /sdcard/src-elvis ~
ln -siv /sdcard/src-elvis/elvis-notes/termux/bashrc.md ~/.bashrc
ln -siv /sdcard/src-elvis/elvis-notes/termux/bash_profile.md ~/.bash_profile
ln -siv /sdcard/src-elvis/elvis-notes/termux/gitconfig.md ~/.gitconfig
ln -sfv /sdcard/src-elvis/elvis-notes/termux/dottermux/termux.properties ~/.termux

pkg update -y
pkg upgrade -y
pkg in x11-repo root-repo android-tools tsu nala lsd gh git lazygit man broot proot proot-distro cpufetch fastfetch debianutils speedtest-go -y

termux-reload-settings
exec $SHELL -l

