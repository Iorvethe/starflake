{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./fish
    ./git.nix
    ./jujutsu.nix
    ./zellij
  ];
}

