# Krohnkite must first be installed
# FIXME: install it via nix
{
  programs.plasma = {
    configFile.kwinrc = {
      # Tiling with krohnkite
      Plugins.krohnkiteEnabled = false;
      Script-krohnkite = {
        enableBTreeLayout = true;
        maximizeSoleTile = false;
        noTileBorder = true;
        screenGapBottom = 5;
        screenGapLeft = 5;
        screenGapRight = 5;
        screenGapTop = 5;
        tileLayoutGap = 5;
      };
    };

    shortcuts = {
      # Tiling shortcuts
      kwin = {
        KrohnkiteBTreeLayout = "Meta+Num+2";
        KrohnkiteDecrease = "Meta+Num+-";
        KrohnkiteFloatAll = "Meta+Shift+F";
        KrohnkiteFloatingLayout = [ ];
        KrohnkiteFocusDown = "Meta+J";
        KrohnkiteFocusLeft = "Meta+H";
        KrohnkiteFocusNext = [ ];
        KrohnkiteFocusPrev = "Meta+,";
        KrohnkiteFocusRight = "Meta+L";
        KrohnkiteFocusUp = "Meta+K";
        KrohnkiteGrowHeight = "Meta+Ctrl+J";
        KrohnkiteIncrease = "Meta+Num++";
        KrohnkiteMonocleLayout = "Meta+M";
        KrohnkiteNextLayout = "Meta+\\,none";
        KrohnkitePreviousLayout = "Meta+|";
        KrohnkiteQuarterLayout = [ ];
        KrohnkiteRotate = [ ];
        KrohnkiteRotatePart = [ ];
        KrohnkiteSetMaster = "Meta+Return";
        KrohnkiteShiftDown = "Meta+Shift+J";
        KrohnkiteShiftLeft = "Meta+Shift+H";
        KrohnkiteShiftRight = "Meta+Shift+L";
        KrohnkiteShiftUp = "Meta+Shift+K";
        KrohnkiteShrinkHeight = "Meta+Ctrl+K";
        KrohnkiteShrinkWidth = "Meta+Ctrl+H";
        KrohnkiteSpiralLayout = [ ];
        KrohnkiteSpreadLayout = [ ];
        KrohnkiteStackedLayout = [ ];
        KrohnkiteStairLayout = [ ];
        KrohnkiteTileLayout = "Meta+Num+1";
        KrohnkiteToggleFloat = "Meta+F";
        KrohnkiteTreeColumnLayout = "Meta+Num+3";
        KrohnkitegrowWidth = "Meta+Ctrl+L";
      };
    };
  };
}
