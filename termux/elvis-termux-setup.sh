termux-setup-storage
ln -siv /sdcard/src-elvis ~
ln -siv /sdcard/src-elvis/elvis-dotfiles/termux/aliases.md ~/.aliases
ln -siv /sdcard/src-elvis/elvis-dotfiles/termux/bashrc.md ~/.bashrc
ln -siv /sdcard/src-elvis/elvis-dotfiles/termux/profile.md ~/.profile
ln -siv /sdcard/src-elvis/elvis-dotfiles/termux/profile.md ~/.zshenv
ln -siv /sdcard/src-elvis/elvis-dotfiles/termux/zshrc.md ~/.zshrc
ln -siv /sdcard/src-elvis/elvis-dotfiles/termux/inputrc.md ~/.inputrc
ln -siv /sdcard/src-elvis/elvis-dotfiles/termux/gitconfig.md ~/.gitconfig
ln -sfv /sdcard/src-elvis/elvis-dotfiles/termux/dottermux/termux.properties ~/.termux
ln -sfv /sdcard/src-elvis/elvis-dotfiles/termux/dottermux/font.ttf ~/.termux
ln -siv /sdcard/src-elvis/elvis-dotfiles/nvim ~/.config

pkg update -y
pkg upgrade -y
pkg in x11-repo root-repo android-tools tsu nala lsd gh git lazygit man broot proot proot-distro cpufetch fastfetch debianutils speedtest-go luarocks -y

termux-reload-settings
exec $SHELL -l

