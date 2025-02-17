#!/bin/bash

tput setaf 2; echo "Upgrade Ubuntu"; tput sgr0
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted

sudo apt-get update -qq
sudo apt-get upgrade dist -y

tput setaf 2; echo "Install git, curl, zips ..."; tput sgr0
sudo apt-get install -y curl
sudo apt-get install -y wget
sudo apt-get install -y tree
sudo apt-get install -y build-essential
sudo apt-get install -y ppa-purge
sudo apt-get install -y git
sudo apt-get install -y git-lfs
sudo apt-get install -y git-flow
sudo apt-get install -y mercurial
sudo apt-get install -y subversion
sudo apt-get install -y openssh-client
sudo apt-get install -y openssh-server
sudo apt-get install -y shellcheck
sudo apt-get install -y alacarte
sudo apt-get install -y gnome-tweak-tool
sudo apt-get install -y gnome-shell-extensions
sudo apt-get install -y chrome-gnome-shell
sudo apt-get install -y snapd
sudo apt-get install -y snapcraft
sudo apt-get install -y libssl-dev
sudo apt-get install -y fonts-firacode
sudo apt-get install -y nnn
sudo apt-get install -y direnv
sudo apt-get install -y bash-completion
sudo apt-get install -y fonts-powerline
sudo apt-get install -y vim

sudo apt-get install -y flatpak
sudo apt-get install -y gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install music player
flatpak install flathub org.gnome.Lollypop


tput setaf 2; echo "Install chrome, vlc, krita, gimp, postman"; tput sgr0
sudo snap install chromium
sudo snap install vlc
sudo snap install krita
sudo snap install gimp
sudo snap install postman

tput setaf 2; echo "Install Slack"; tput sgr0
sudo snap install slack --classic

# Change swappiness, default 60, 0 disable
echo vm.swappiness=0 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# Change nuber of inotify max watcher, default 8192
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
# Change nuber of inotify max queued events, default 16384
echo fs.inotify.max_queued_events=32768 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
# Change nuber of inotify max user instances, default 128
echo fs.inotify.max_user_instances=256 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p


tput setaf 2; echo "Do you want to install vanilla Gnome"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo apt-get remove -y gnome-session

            
            gsettings set org.gnome.desktop.lockdown disable-lock-screen true
            gsettings set org.gnome.desktop.screensaver lock-enabled false
            break;;
        No ) break;;
    esac
done


tput setaf 2; echo "Do you want to install Zeal - Documentation"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo apt-get install -y zeal
            break;;
        No ) break;;
    esac
done


tput setaf 2; echo "Do you want to disable mitigations"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            echo "add mitigations=off to GRUB_CMDLINE_LINUX_DEFAULT"
            sudo vim /etc/default/grub
            sudo update-grub
            break;;
        No ) break;;
    esac
done


tput setaf 2; echo "Do you want to install Firefox Nightly"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo add-apt-repository -y ppa:ubuntu-mozilla-daily/ppa
            sudo apt-get update -qq
            sudo apt-get install -y firefox-trunk
            break;;
        No ) break;;
    esac
done


tput setaf 2; echo "Do you want to install PPA Manager"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo add-apt-repository ppa:webupd8team/y-ppa-manager
            sudo apt-get update -qq
            sudo apt-get install -y  y-ppa-manager
            break;;
        No ) break;;
    esac
done


tput setaf 2; echo "Do you want to install Dropbox"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo apt-get -y install nautilus-dropbox
            break;;
        No ) break;;
    esac
done


tput setaf 2; echo "Do you want to install Steam"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo apt-get -y install steam
            break;;
        No ) break;;
    esac
done


tput setaf 2; echo "Do you want to install Chrome Beta"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
            sudo add-apt-repository 'deb http://dl.google.com/linux/chrome/deb/ stable main'
            sudo apt-get update -qq
            sudo apt-get install -y google-chrome-beta
            break;;
        No ) break;;
    esac
done


tput setaf 2; echo "Do you want to install Vivaldi"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
            sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
            sudo apt-get update -qq
            sudo apt-get install -y vivaldi-stable
            break;;
        No ) break;;
    esac
done


tput setaf 2; echo "Do you want to install Spotify"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo snap install spotify
            break;;
        No ) break;;
    esac
done


tput setaf 2; echo "Do you want to install Discord"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo apt-get install -y gdebi-core wget
            wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"

            sudo gdebi ~/discord.deb
            break;;
        No ) break;;
    esac
done




tput setaf 2; echo "Do you want to install Picard"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo snap install picard --classic
            break;;
        No ) break;;
    esac
done

tput setaf 2; echo "Install Kube tools kubectl and microk8s"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo snap install kubectl --classic
            sudo snap install microk8s --classic

            break;;
        No ) break;;
    esac
done
