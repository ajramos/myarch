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
In order to know the keyboard code for a specific key execute the following
```
xev -event keyboard
```

## Install launcher and panel (and some other tweak tools)
```
yay -S picom feh nitrogen tilix polybar rofi dunst libnotify
```

## Install fonts (for polybar) 
```
yay -S fontconfig siji xorg-xfg xorg-fonts-misc
```

## Install other utils
```
yay -S ranger nnn mc pywal pcmanfm tmux neovim which htop gotop powertop
yay -S usbutils iotop xarchiver jq yad libinput-gestures gimp
yay -S clipmenu scrot xbacklight xfce4-power-manager pqiv gparted
yay -S zathura zathura-cb zathura-djvu zathura-pdf-poppler \
zathura-ps vlc
yay -S remmina kazam handbrake notion-app pdfmixtool onlyoffice transmission-gtk
```

## Install Trash can compatibility and device,network and google automount
```
yay -S udisks2 gvfs gvfs-smb 
```

## Install screensaver & screen locker
```
yay -S betterlockscreen i3-lock imagemagick xorg-xdpyinfo
betterlockscreen -u ~/Pictures/city.jpg
```

## Install internet utils
```
yay -S firefox elinks lynx curl chromium neomutt bmon wget nm-connection-editor
yay -S youtube-dl
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

## Rofi customization
```
git clone --depth 1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
echo "export PATH=$HOME/.config/rofi/bin:$PATH" >> ~/.zshrc
```

## Display Manager
```
yay -S lightdm lightdm-gtk-greeter lightdm-slick-greeter
sudo systemctl enable lightdm
```

## Development tools
```
yay -S github-cli code hugo go2 robo3t-bin postman-bin mongodb-compass
portainer go-swagger
```

## Install Printer service and drivers
```
yay -S cups cups-pdf foomatic-db-ppds avahi nss-mdns system-config-printer
```
After install cups-pdf it must be enabled with, the restart will allow to access
to the [CUPS Web Admin](http://localhost:631)
```
sudo systemctl enable cups
sudo systemctl restart cups
sudo systemctl status systemd-resolved #Check it is disabled
sudo systemctl enable avahi-daemon
```
Finally modify the file /etc/nsswitch.conf adding "mdns_minimal [NOTFOUND=return]":
before the "resolve" statement in the "hosts" line, after doing so, restart
avahi-daemon:
```
hosts: ... mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] dns ...
```
You should be able to list the services within your network by running:
```
avahi-browse --all --ignore-local --resolve --terminate

```
You can also use bssh and bvnc for looking for SSH and VNC Servers.

Add your user group to the statement "SystemGroup" in the file 
/etc/cups/cups-files.conf
```
SystemGroup sys root wheel ajramos
```

## Install Scanner
```
yay -S sane-airscan simple-scan
```

## Install Collaboration and SNS
```
yay -S slack-desktop telegram-desktop cawbird
```
