# myarch
Arch Install &amp; Config

After a plain arch installation install the following:

## Install yay
```
sudo pacman --needed git base-devel
cd /opt
sudo git clone https:/aur.archlinux.org/yay-git.git
sudo chown -R ajramos:ajramos ./yay-git
cd yay-git 
makepkg -si
```

## Install xserver
```
yay -S xorg-server xorg-xinit xterm xorg-xclock xrandr xorg-xprop xorg-apps
```

## Install graphic card drivers (watch arch linux Xorg installation guide)
```
yay -S xf86-video-intel
```

## Install bspwm and sxhkd
```
yay -S bspwm sxhkd 
```

## Install launcher and panel (and some other tweak tools)
```
yay -S picom feh nitrogen tilix polybar rofi
```

## Install fonts (for polybar) 
```
yay -S fontconfig siji xorg-xfg xorg-fonts-misc
```

## Install other utils
```
yay -S ranger nnn mc pywal pcmanfm tmux neovim which htop gotop 
yay -S clipmenu 
```

## Install screensaver & screen locker
```
yay -S betterlockscreen i3-lock imagemagick xorg-xdpyinfo
betterlockscreen -u ~/Pictures/city.jpg
```

## Install internet utils
```
yay -S firefox elinks lynx curl chromium neomutt
```

## Install audio system
```
yay -S alsa-utils pulseaudio pulseaudio-alsa
```

## Install oh-my-zsh
```
yay -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
## Install cloud utils
```
yay -S google-cloud-sdk kubens kubectx k9s dive velero linkerd popeye
gcloud auth login
gcloud config set project $PROJECT_NAME
```


## Vim Plugins
```
yay -S vim-plug python-pip ctags
touch $HOME/.vim/plugins.vim
python3 -m pip install --user --upgrade pynvim
nvim +PlugInstall
nvim +GoInstallBinaries
```

## Look & Feel customization
```
yay -S matcha-gtk-theme lxappearance-gtk3 flat-remix bibata-cursor-theme
```

## Polybar personalization
If this is the first time and you want to restart config at .config/polybar
otherwise, it is not required.

Also be aware you probable will need to check the modules initialization,
for example for battery, brightness, and so on, please follow instructions
within the config files. 
```
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
cd polybar-themes
chmod +x setup.sh
./setup.sh
```

## Display Manager
```
yay -S lightdm lightdm-gtk-greeter lightdm-slick-greeter
sudo systemctl enable lightdm
```

## Development tools
```
yay -S github-cli code hugo
```
