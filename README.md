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
yay -S xorg-server xorg-xinit xterm xorg-xclock xrander xorg-prop [xorg-apps]
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
yay -S fontconfig siji-git xorg-xfg xorg-fonts-misc
```

## Install other utils
```
yay -S ranger nnn pywal firefox pcmanfm
```


