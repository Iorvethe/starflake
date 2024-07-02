{ pkgs, ... }:
{
  # Package
  home.packages = with pkgs; [
    kde-rounded-corners
  ];

  programs.plasma = {
    configFile = {
      kwinrc = {
        "Effect-ًRound-Corners" = {
          ActiveOutlineUseCustom = false;
          ActiveOutlineUsePalette = true;
          InactiveCornerRadius = 5;
          Size = 5;
        };
      };
    };
  };
}

