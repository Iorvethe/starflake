# {
#   programs.plasma.configFile."okularpartrc" = {

#     "Core Performance" = {
#       MemoryLevel = "Aggressive";
#     };

#     "Dlg Accessibility" = {
#       # From Rosé Pine, base of Moon and Dawn
#       RecolorBackground="35,33,54";
#       RecolorForeground="250,244,237";
#     };

#     "Document" = {
#       RenderMode="Recolor";
#     };

#     "General" = {
#       ShellOpenFileInTabs=true;
#     };
#   };
# }

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

# {
  
# }
