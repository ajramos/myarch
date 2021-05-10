all: copy-config backup-config
copy-config:
	@echo "Copying config files..."
	@cp -v ~/{.zshrc,.vimrc,.tmux.conf,.robomongorc.js} .
	@cp -v ~/{.gitconfig,.gtkrc-2.0,.xinitrc,.profile} .
	@cp -vr ~/.config/bspwm .
	@cp -vr ~/.config/dunst .
	@cp -vr ~/.config/kitty .
	@cp -vr ~/.config/nvim .
	@cp -vr ~/.config/sxhkd .
	@cp -vr ~/.config/picom .
	@cp -vr ~/.config/polybar .
	@cp -vr ~/.config/rofi .
	@cp -vr ~/.config/sxhkd .
	@cp -vr ~/.config/tilix .
	@cp -vr ~/.config/gtk-3.0 .
	@cp -vr ~/.config/pcmanfm .
	@cp -v ~/.oh-my-zsh/custom/aliases.zsh oh-my-zsh/
	@cp -v /etc/X11/xorg.conf.d/40-libinput.conf ./X11/xorg.conf.d/
	@cp -v /etc/lightdm/{lightdm.conf,slick-greeter.conf} ./lightdm/
	@cp -vr ~/.local/share/fonts local/share/
	@cp -v /etc/nsswitch.conf printer/nss-mdns/
	@yay -Q > package_list.txt

deploy: aliases-config bspwm-config dotfiles-config dunst-config fonts-config \
gtk-3.0-config kitty-config lightdm-config lock-config \
nvim-config pcmanfm-config pdf-default-config picom-config \
polybar-config printer-config rofi-config sxhkd-config \
tilix-config vim-theme-config wallpaper-config xorg-config 

aliases-config:
	@echo "Deploying oh-my-zsh aliases files..."
	@mkdir -pv ~/.oh-my-zsh/custom
	@cp -vr oh-my-zsh/aliases.zsh ~/.oh-my-zsh/custom/

bspwm-config:
	@echo "Deploying bspwm config files..."
	@mkdir -pv ~/.config/bspwm
	@cp -vr bspwm/ ~/.config/

dotfiles-config:
	@echo "Deploying dotfiles..."
	@cp -v {.zshrc,.tmux.conf,.robomongorc.js} ~
	@cp -v {.gitconfig,.gtkrc-2.0,.xinitrc,.profile} ~

dunst-config:
	@echo "Deploying dunst config files..."
	@mkdir -pv ~/.config/dunst
	@cp -vr dunst/ ~/.config/

fonts-config:
	@echo "Deploying font files..."
	@mkdir -pv ~/.local/share/fonts
	@cp -vr local/share/fonts ~/.local/share/

gtk-3.0-config:
	@echo "Deploying gtk3 files..."
	@mkdir -pv ~/.config/gtk-3.0
	@cp -vr gtk-3.0/ ~/.config/

kitty-config:
	@echo "Deploying kitty files..."
	@mkdir -pv ~/.config/kitty
	@cp -vr kitty/ ~/.config/

lightdm-config:
	@echo "Deploying window manager files..."
	@sudo cp -v lightdm/lightdm.conf /etc/lightdm/
	@sudo cp -v lightdm/slick-greeter.conf /etc/lightdm/

lock-config:
	@echo "Setting lock screen config..."

nvim-config:
	@echo "Setting Neovim config..."
	@mkdir -pv ~/.config/nvim
	@cp -vr nvim/ ~/.config/
	@nvim +PlugInstall

pcmanfm-config:
	@echo "Deploying PCManFM config files..."
	@mkdir -pv ~/.config/pcmanfm
	@cp -vr pcmanfm/ ~/.config/

pdf-default-config:	
	@echo "Setting Zathura as default PDF viewer..."
	@xdg-mime default org.pwmt.zathura.desktop application/pdf

picom-config:
	@echo "Deploying picom config files..."
	@mkdir -pv ~/.config/picom
	@cp -vr picom/ ~/.config/

polybar-config:
	@echo "Deploying polybar config files..."
	@mkdir -pv ~/.config/polybar
	@cp -vr polybar/ ~/.config/

printer-config:
	@echo "Deploying printer config files..."
	@sudo cp -v printer/nss-mdns/nsswitch.conf /etc/
	@sudo cp -v cups/cups-files.conf /etc/cups/
	@sudo chown root:cups /etc/cups/cups-files.conf

rofi-config:
	@echo "Deploying rofi config files..."
	@mkdir -pv ~/.config/rofi
	@cp -vr rofi/ ~/.config/

sxhkd-config:
	@echo "Deploying sxhkd config files..."
	@mkdir -pv ~/.config/sxhkd
	@cp -vr sxhkd/ ~/.config/

tilix-config:
	@echo "Deploying tilix config files..."
	@mkdir -pv ~/.config/tilix
	@cp -vr tilix/ ~/.config/

vim-theme-config:
	@echo "Deploying vim config files..."
	@mkdir -p ~/.vim/pack/themes/start
	@cd ~/.vim/pack/themes/start
	@git clone https://github.com/dracula/vim.git dracula

wallpaper-config:
	@echo "Deploying wallpaper config files..."
	@mkdir -pv ~/Pictures
	@cp -v wallpapers/city.jpg ~/Pictures/
	@sudo cp -v wallpapers/city.jpg /usr/share/pixmaps/
	@betterlockscreen -u ~/Pictures/city.jpg

xorg-config:
	@echo "Deploying XOrg config files..."
	@sudo cp -v X11/xorg.conf.d/* /etc/X11/xorg.conf.d/

backup-repo:
	@echo "Backing files..."
	@git add -u .;
	@git commit -m "New backup `date +'%Y-%m-%d %H:%M'`";
	@git push origin main;

locale-config:
	sudo localectl set-keymap es
	sudo localectl set-x11-keymap es


install-all: xserver video-driver wm audio launch-bar fm utils media gvfs \
				screenlocker internet zsh cloud theme dm dev printer \
				scanner sns

yay:
	@sudo pacman -S --needed git base-devel
	@cd /opt
	@sudo git clone https:/aur.archlinux.org/yay.git
	@sudo chown -R ajramos:ajramos ./yay
	@cd yay
	@makepkg -si

xserver:
	@yay -S xorg-server xorg-xinit xterm xorg-xclock xorg-xrandr xorg-xprop xorg-apps

video-driver:
	@yay -S xf86-video-intel

wm:
	@yay -S bspwm sxhkd 

audio:
	@yay -S alsa-utils pulseaudio pulseaudio-alsa

launch-bar:
	@yay -S picom feh nitrogen tilix polybar rofi dunst libnotify \
	fontconfig siji xorg-xfd xorg-fonts-misc

fm:
	@yay -S ranger nnn mc pcmanfm

utils:
	@yay -S pywal tmux neovim which htop gotop powertop iotop usbutils jq yad \
	xarchiver libinput-gestures clipmenu scrot xorg-xbacklight xfce4-power-manager \
	pqiv gparted zathura zathura-cb zathura-djvu zathura-pdf-poppler zathura-ps \
	remmina pdfmixtool onlyoffice

media:
	@yay -S gimp kazam handbrake vlc

gvfs:
	@yay -S udisks2 gvfs gvfs-smb 

screenlocker:
	@yay -S betterlockscreen imagemagick xorg-xdpyinfo
	@betterlockscreen -u ~/Pictures/city.jpg

internet:
	@yay -S firefox elinks lynx curl chromium neomutt bmon wget \
	nm-connection-editor youtube-dl transmission-gtk

zsh:
	@yay -S zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cloud:
	@yay -S google-cloud-sdk kubens kubectx k9s dive velero linkerd popeye helm
#	@gcloud auth login
#	@gcloud config set project $PROJECT_NAME

nvim-plugin:
	@yay -S vim-plug python-pip ctags
	@touch ~/.vim/plugins.vim
	@python3 -m pip install --user --upgrade pynvim
	@nvim +PlugInstall
	@nvim +GoInstallBinaries

theme:
	@yay -S matcha-gtk-theme lxappearance-gtk3 flat-remix bibata-cursor-theme

dm:
	@yay -S lightdm lightdm-gtk-greeter lightdm-slick-greeter
	@sudo systemctl enable lightdm

dev:
	@yay -S github-cli code hugo go2 robo3t-bin postman-bin mongodb-compass \
	portainer go-swagger

printer:
	@yay -S cups cups-pdf foomatic-db-ppds avahi nss-mdns system-config-printer
	@sudo systemctl enable cups
	@sudo systemctl restart cups
	@sudo systemctl status systemd-resolved #Check it is disabled
	@sudo systemctl enable avahi-daemon

scanner:
	@yay -S sane-airscan simple-scan

sns:
	@yay -S slack-desktop telegram-desktop cawbird
