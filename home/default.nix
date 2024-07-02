{ config, pkgs, ... }:

{
  imports = [
    ./plasma
    ./programs
    ./services
  ];
}
