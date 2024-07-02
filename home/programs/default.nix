{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./fish
    ./git.nix
    ./helix
    ./jujutsu.nix
    ./zellij
    ./zoxide.nix
  ];
}

