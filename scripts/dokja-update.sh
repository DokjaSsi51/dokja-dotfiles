#! /usr/bin/env bash

cd ~/dokja-dotfiles &&
pacman -Qqe > pacman-packages.txt &&
paru -Syu --noconfirm &&
nix flake update &&
home-manager switch --flake .#dokja --impure &&
cd