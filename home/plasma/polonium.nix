{ pkgs, ... }:
{
  # Package
  home.packages = with pkgs; [
    libsForQt5.polonium
  ];

  programs.plasma = {

    configFile.kwinrc = {
      # Tiling with polonium
      Plugins.poloniumEnabled = true;
      Script-polonium = {
        InsertionPoint = 1;
        MaximizeSingle = true;
      };
    };

    shortcuts = {
      # Tiling shortcuts
      kwin = {
        PoloniumCycleEngine = "Meta+|";
        PoloniumFocusAbove = "Meta+K";
        PoloniumFocusBelow = "Meta+J";
        PoloniumFocusLeft = "Meta+H";
        PoloniumFocusRight = "Meta+L";
        PoloniumInsertAbove = "Meta+Shift+K";
        PoloniumInsertBelow = "Meta+Shift+J";
        PoloniumInsertLeft = "Meta+Shift+H";
        PoloniumInsertRight = "Meta+Shift+L";
        PoloniumOpenSettings = "Meta+\\,none";
        PoloniumResizeAbove = "Meta+Ctrl+K";
        PoloniumResizeBelow = "Meta+Ctrl+J";
        PoloniumResizeLeft = "Meta+Ctrl+H";
        PoloniumResizeRight = "Meta+Ctrl+L";
        PoloniumRetileWindow = "Meta+Shift+Space";
        PoloniumSwitchBTree = "Meta+Num+1";
        PoloniumSwitchHalf = "Meta+Num+2";
        PoloniumSwitchKwin = [ ];
        PoloniumSwitchMonocle = "Meta+M";
        PoloniumSwitchThreeColumn = "Meta+Num+3";
      };
    };
  };
}
