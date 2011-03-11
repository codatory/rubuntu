#!/bin/bash
#
# Codatory's Codebox Initializer Script for Ubuntu 10.04
#
# Installs and Configures TMUX, Vim and Janus on Ubuntu 10.04 for proper Ruby development
pretty_echo(){ 
  echo "****************************************"
  echo "* $1"
  echo "****************************************"
}

pretty_echo "Updating OS"
sudo apt-get update && sudo apt-get dist-upgrade -y --force-yes

pretty_echo "Installing dependencies"
sudo apt-get install vim-nox tmux rake ruby-dev ruby exuberant-ctags git-core wget curl openssl libreadline6 libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev subversion g++ openjdk-6-jre-headless ant openjdk-6-jdk -y

echo 'check_certificate=off' >> ~/.wgetrc

pretty_echo "Installing Janus"
curl https://github.com/carlhuda/janus/raw/master/bootstrap.sh -# -o - | sh

pretty_echo "Installing RVM"
curl https://rvm.beginrescueend.com/releases/rvm-install-head -# > ~/rvm-install.sh
chmod +x ~/rvm-install.sh
bash ~/rvm-install.sh

pretty_echo "Configuring .profile"
curl https://github.com/codatory/rubuntu/raw/master/profile -# >> ~/.profile
source ~/.profile

pretty_echo "Configuring RVM"
curl https://github.com/codatory/rubuntu/raw/master/rvmrc -# > ~/.rvmrc

pretty_echo "Configuring .bashrc"
curl https://github.com/codatory/rubuntu/raw/master/bashrc -# > ~/.bashrc
source ~/.bashrc

pretty_echo "Setting RVM Default to REE"
rvm use ree --default

pretty_echo "Generating SSH RSA Key"
ssh-keygen -q -t rsa -f ~/.ssh/id_rsa -N ''

pretty_echo "Cleaning up"

rm -rf ~/rvm-install.sh
