{
  programs.okular = {
    enable = true;

    general = {
      openFileInTabs = true;
    };

    accessibility = {
      changeColors = {
        enable = false;
        mode = "Recolor";
        paperColor = "250,244,237";
        recolorBackground = "35,33,54";
        recolorForeground = "250,244,237";
      };
    };

    performance = {
      memoryUsage = "Agressive";
    };
  };
}
