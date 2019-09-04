#!/bin/bash
#====================================================================
# aptのアップデート
#====================================================================
yes | sudo apt-get update
yes | sudo apt-get upgrade

#====================================================================
# 『デスクトップ』『音楽』などの日本語フォルダー名を英語表記にする
#====================================================================
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

#====================================================================
# ソフトウェアインストール
#====================================================================

# fonts
yes | sudo apt-get install fonts-vlgothic

# 様々なツール ======================================================
yes | sudo apt-get install guake
yes | sudo apt-get install chromium-browser
yes | sudo apt-get install chromium-browser-l10n
#yes | sudo apt-get install fcitx-mozc # use mint default installer
#yes | sudo apt-get install mozc       # use mint default installer
#yes | sudo apt-get install emacs-mozc  # for sublime text
#yes | sudo apt-get install git
yes | sudo apt-get install clipit
yes | sudo apt-get install pbcopy
yes | sudo apt-get install shutter
#yes | sudo apt-get install clementine
yes | sudo apt-get install virtualbox
yes | sudo apt-get install evince
yes | sudo apt-get install filezilla
yes | sudo apt-get install mvp
yes | sudo apt-get install vagrant
#yes | sudo apt-get install clamtk

# battery-monitor =================================================
#sudo add-apt-repository -y ppa:maateen/battery-monitor
#sudo apt-get update
#yes | sudo apt-get install battery-monitor

# albert ==========================================================
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt-get update
yes | sudo apt-get install albert

# icon & theme ====================================================
yes | sudo add-apt-repository ppa:snwh/pulp
yes | sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
yes | sudo apt-get install paper-icon-theme
yes | sudo apt-get install arc-icons
yes | sudo apt-get install arc-theme

wget -O la-captaine.zip https://www.dropbox.com/s/qmzcj8jpx33vthy/la-capitaine.zip?dl=1 && unzip la-captaine.zip && mv la-capitaine ~/.icons
wget -O Cupertino.zip https://www.dropbox.com/s/s9xxo7fjtv2rwf5/macOS.zip?dl=1 && unzip Cupertino.zip && mv macOS Cupertino && mv Cupertino ~/.icons

# docker ===========================================================
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
yes | sudo apt-get update
yes | sudo apt-get install docker-ce


# vivaldi ===========================================================
wget http://repo.vivaldi.com/stable/linux_signing_key.pub
sudo apt-key add linux_signing_key.pub
echo deb http://repo.vivaldi.com/stable/deb/ stable main | sudo tee /etc/apt/sources.list.d/vivaldi.list
yes | sudo apt-get update
yes | sudo apt install vivaldi-stable

# caffeine ==========================================================
yes | sudo add-apt-repository ppa:caffeine-developers/ppa
yes | sudo apt-get update
yes | sudo apt-get install caffeine


# spotify ============================================================
# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410

## 2. Add the Spotify repository
#echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
#yes | sudo apt-get update

# 4. Install Spotify
#yes | sudo apt-get install spotify-client

# sublime text ============================================
#yes | sudo add-apt-repository ppa:webupd8team/sublime-text-2
#yes | sudo apt-get update
#yes | sudo apt-get install sublime-text

# oracle jdk ==============================================
#yes | sudo apt-get remove openjdk*
#yes | sudo add-apt-repository -y ppa:webupd8team/java
#yes | sudo apt-get update
#sudo apt-get install -y java-common oracle-java8-installer
#sudo apt-get install -y oracle-java8-set-default
#source /etc/profile

# snapd ===================================================
yes | sudo apt-get install snapd

# phpstorm ================================================
# wget https://download-cf.jetbrains.com/webide/PhpStorm-2016.1.2.tar.gz  # confirm ver
# tar xvf PhpStorm-2016.1.2.tar.gz
# sudo mv PhpStorm-145.1616.3/ /opt/phpstorm/
# sudo ln -s /opt/phpstorm/bin/phpstorm.sh /usr/local/bin/phpstorm

sudo snap install phpstorm --classic
sudo ln -s /snap/bin/phpstorm /usr/local/bin/phpstorm

# rubymine ================================================
sudo snap install rubymine --classic
sudo ln -s /snap/bin/rubymine /usr/local/bin/rubymine


# fingerprint =============================================
#yes | sudo apt-add-repository -y ppa:fingerprint/fingerprint-gui
#yes | sudo apt-get update
#yes | sudo apt-get install libbsapi policykit-1-fingerprint-gui fingerprint-gui

# but now 2017/08/05, there is not fingerprint device driver for linux

# iphone 有線USBテザリング =================================
yes | sudo apt-get install ipheth-utils
sudo modprobe ipheth
yes | sudo bash -c 'echo ipheth >> /etc/modules'


# f.lux ===================================================
# Install dependencies
yes | sudo apt-get install git python-appindicator python-xdg python-pexpect python-gconf python-gtk2 python-glade2 libxxf86vm1

# Download xflux-gui
cd /tmp
git clone "https://github.com/xflux-gui/xflux-gui.git"
cd xflux-gui
python download-xflux.py

# EITHER install globally
yes | sudo python setup.py install
# EXCLUSIVE OR, install in your home directory. The binary installs
# into ~/.local/bin, so be sure to add that to your PATH if installing locally.
python setup.py install --user

# Run flux
# fluxgui

# vim 8 ======================================================
sudo add-apt-repository -y ppa:jonathonf/vim
yes | sudo apt update
yes | sudo apt install vim

# dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim

# my provision memo
# 自分の.vimrc落として~/にcp
# .vim/はコピーしない。

# vscode ====================================================
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
yes | sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
yes | sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
yes | sudo apt-get update
yes | sudo apt-get install code


# docker user settngs =======================================
# dockerグループがなければ作る
sudo groupadd docker

# 現行ユーザをdockerグループに所属させる
sudo gpasswd -a $USER docker

# dockerデーモンを再起動する (CentOS7の場合)
sudo systemctl restart docker

# Windows との時刻のズレを解消 =================================
sudo timedatectl set-local-rtc 1

# powertop and tlp =============================================
yes | sudo apt-get install powertop
yes | sudo powertop --auto-tune

yes | sudo add-apt-repository ppa:linrunner/tlp
yes | sudo apt-get update
yes | sudo apt-get install tlp tlp-rdw

echo 'need restart for complete docker install'


