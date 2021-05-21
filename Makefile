all: copy-config backup-config
copy-config:
	@echo "Copying config files..."
	@cp -v ~/.zshrc ./zsh/
	@cp -v ~/.vimrc ./vim/
	@cp -v ~/.tmux.conf ./tmux/
	@cp -v ~/.robomongorc.js ./robo3t/
	@cp -v ~/.gitconfig ./git/
	@cp -v ~/.gtkrc-2.0 ./gtk2/
	@cp -v ~/.xinitrc ./xinit/
	@cp -v ~/.profile ./profile/
	@cp -v ~/.config/starship.toml ./starship/
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
	@cp -v /etc/lightdm/{lightdm.conf,slick-greeter.conf,display_setup.sh} ./lightdm/
	@cp -vr ~/.local/share/fonts local/share/
	@cp -v /etc/nsswitch.conf printer/nss-mdns/
	@code --list-extensions | sed -e 's/^/code --install-extension /' > ./vscode/my_vscode_extensions.sh
	@yay -Q > package_list.txt

deploy: aliases-config bspwm-config dotfiles-config dunst-config fonts-config \
gtk-3.0-config kitty-config lightdm-config lock-config \
nvim-config pcmanfm-config pdf-default-config picom-config \
polybar-config printer-config rofi-config sxhkd-config \
tilix-config vim-theme-config wallpaper-config xorg-config \
starship-config power-config vscode-config

aliases-config:
	@echo "Deploying oh-my-zsh aliases files..."
	@echo "OMZ should be previously installed at ~/.oh-my-zsh/custom"
	@echo "Press ENTER for continue"
	@read
	@cp -vr oh-my-zsh/aliases.zsh ~/.oh-my-zsh/custom/

bspwm-config:
	@echo "Deploying bspwm config files..."
	@mkdir -pv ~/.config/bspwm
	@cp -vr bspwm/ ~/.config/

cloud-config:
	@echo "Execute de following commannd to get cloud env ready..."
	echo "gcloud auth login"
	echo "gcloud config set project $PROJECT_NAME"
	echo "sudo usermod -a -G docker $USER"

dotfiles-config:
	@echo "Deploying dotfiles..."
	@cp -v ./zsh/.zshrc ~
	@cp -v ./vim/.vimrc ~
	@cp -v ./tmux/.tmux.conf ~
	@cp -v ./robo3t/.robomongorc.js ~
	@cp -v ./git/.gitconfig ~
	@cp -v ./gtk2/.gtkrc-2.0 ~
	@cp -v ./xinit/.xinitrc ~
	@cp -v ./profile/.profile ~

dunst-config:
	@echo "Deploying dunst config files..."
	@mkdir -pv ~/.config/dunst
	@cp -vr dunst/ ~/.config/

fonts-config:
	@echo "Deploying font files..."
	@mkdir -pv ~/.local/share/fonts
	@cp -vr local/share/fonts ~/.local/share/

grub-config:
	@echo "Updating grub config..."
	sudo cp -vi grub/grub /etc/default/grub
	sudo grub-mkconfig -o /boot/grub/grub.cfg
	sudo grub-mkconfig -o /boot/efi/EFI/arch/grub.cfg

gtk-3.0-config:
	@echo "Deploying gtk3 files..."
	@mkdir -pv ~/.config/gtk-3.0
	@cp -vr gtk-3.0/ ~/.config/

kitty-config:
	@echo "Deploying kitty files..."
	@mkdir -pv ~/.config/kitty
	@cp -vr kitty/ ~/.config/

lightdm-config:
	@echo "Deploying window manager files...(requires sudo)"
	sudo cp -v lightdm/lightdm.conf /etc/lightdm/
	sudo cp -v lightdm/slick-greeter.conf /etc/lightdm/
	@read

locale-config:
	@echo "Setting locale config...(requires sudo)"
	sudo localectl set-keymap es
	sudo localectl set-x11-keymap es
	@read

nvidia-config:
	@echo "Adding pacman hook to include driver and drm modeset every time the kernel updates"
	sudo mkdir -pv /etc/pacman.d/hooks
	sudo cp nvidia/nvidia.hook /etc/pacman.d/hooks/nvidia.hook
	@echo "If Offloading Graphic Display NVIDIA -> Intel Display execute"
	echo "sudo cp ./X11/xorg.conf /etc/X11/"
	@echo "If Prime Render, use Intel mainly and execute prime-run command for NVIDIA"
	echo "sudo cp ./X11/xorg.conf.d/nvidia.conf /etc/X11/xorg.conf.d/"

nvim-config:
	@echo "Setting Neovim config...(requires vim-plug package)"
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

power-config:
	@echo "Setting locale config...(requires sudo)"
	sudo powertop --auto-tune
	@read

printer-config:
	@echo "Deploying printer config files...(requires sudo)"
	sudo cp -v printer/nss-mdns/nsswitch.conf /etc/
	sudo cp -v cups/cups-files.conf /etc/cups/
	sudo chown root:cups /etc/cups/cups-files.conf
	@read

pulseaudio-config:
	@echo "Activation of the echo cancellation filter"
	echo "load-module module-echo-cancel" | sudo tee -a /etc/pulse/default.pa

rofi-config:
	@echo "Deploying rofi config files..."
	@mkdir -pv ~/.config/rofi
	@cp -vr rofi/ ~/.config/

starship-config:
	@echo "Installing/updating starship..."
	@curl -fsSL "https://starship.rs/install.sh" > ./install.sh
	@chmod 755 ./install.sh
	@./install.sh
	@cp -v ./starship/starship.toml ~/.config/starship.toml

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

vscode-config:
	@echo "installing VSCode extensions..."
	@./vscode/my_vscode_extensions.sh

wallpaper-config:
	@echo "Deploying wallpaper config files...(requires sudo)"
	@mkdir -pv ~/Pictures
	@cp -v wallpapers/city.jpg ~/Pictures/
	@betterlockscreen -u ~/Pictures/city.jpg
	sudo cp -v wallpapers/city.jpg /usr/share/pixmaps/
	@read

xorg-config:
	@echo "Deploying XOrg config files...(requires sudo)"
	sudo cp -v X11/xorg.conf.d/* /etc/X11/xorg.conf.d/
	@read

backup-repo:
	@echo "Backing files..."
	@git add -u .;
	@git commit -m "New backup `date +'%Y-%m-%d %H:%M'`";
	@git push origin main;

install-all: xserver video-driver wm audio launch-bar fm utils media gvfs \
screenlocker internet zsh cloud theme dm dev printer \
scanner sns

yay:
	@echo "Installing pacman wrapper...(requires sudo)"
	sudo pacman -S --needed git base-devel
	cd /opt
	sudo git clone https:/aur.archlinux.org/yay.git
	sudo chown -R ajramos:ajramos ./yay
	cd yay
	makepkg -si
	@read

xserver:
	@yay -S xorg-server xorg-xinit xterm xorg-xclock xorg-xrandr xorg-xprop xorg-apps

video-driver:
	@yay -S nvidia nvidia-prime nvidia-settings nvidia-dkms nvidia-utils mesa-demos

bluetooth:
	@yay -S bluez bluez-utils pulseaudio-bluetooth blueman

wm:
	@yay -S bspwm sxhkd 

audio:
	@yay -S alsa-utils pulseaudio pulseaudio-alsa paprefs pavucontrol

launch-bar:
	@yay -S picom feh nitrogen tilix polybar rofi dunst libnotify \
	fontconfig siji xorg-xfd xorg-fonts-misc ttf-iosevka-term noto-fonts-emoji

fm:
	@yay -S ranger nnn mc pcmanfm

utils:
	@yay -S pywal tmux neovim which htop gotop powertop iotop usbutils jq yad \
	xarchiver libinput-gestures clipmenu scrot xorg-xbacklight xfce4-power-manager \
	pqiv gparted zathura zathura-cb zathura-djvu zathura-pdf-poppler zathura-ps \
	remmina pdfmixtool onlyoffice neofetch hwinfo xorg-xclipboard xclip dos2unix

media:
	@yay -S gimp kazam handbrake vlc

gvfs:
	@yay -S udisks2 gvfs gvfs-smb 

screenlocker:
	@yay -S betterlockscreen imagemagick xorg-xdpyinfo

internet:
	@yay -S firefox elinks lynx curl chromium neomutt bmon wget \
	nm-connection-editor youtube-dl transmission-gtk

zsh:
	@yay -S zsh
	@curl -fsSL "https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh" > install.sh 
	@chmod 755 ./install.sh 
	@./install.sh

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
	@echo "Deploying desktop manager...(requires sudo)"
	@yay -S lightdm lightdm-gtk-greeter lightdm-slick-greeter
	sudo systemctl enable lightdm
	@read

dev:
	@yay -S github-cli code hugo go2 robo3t-bin postman-bin mongodb-compass \
portainer go-swagger

printer:
	@echo "Deploying printer config...(requires sudo)"
	@yay -S cups cups-pdf foomatic-db-ppds avahi nss-mdns system-config-printer
	sudo systemctl enable cups
	sudo systemctl restart cups
	sudo systemctl status systemd-resolved #Check it is disabled
	sudo systemctl enable avahi-daemon
	@read

scanner:
	@yay -S sane-airscan simple-scan

sns:
	@yay -S slack-desktop telegram-desktop cawbird skypeforlinux-stable-bin

bluetooth-config:
	sudo systemctl start bluetooth
