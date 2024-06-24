{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./git.nix
    ./jujutsu.nix
    ./zellij
  ];
}

