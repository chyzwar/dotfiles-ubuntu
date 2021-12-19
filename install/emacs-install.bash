#!/bin/bash

tput setaf 2; echo "Install emacs 25"; tput sgr0
sudo snap install emacs --classic

tput setaf 2; echo "Install spacemac"; tput sgr0
git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d
