#! /usr/bin/env bash

cd ~/dokja-dotfiles &&
pacman -Qqe > pacman-packages.txt &&
home-manager switch --flake .#dokja --impure &&
cd