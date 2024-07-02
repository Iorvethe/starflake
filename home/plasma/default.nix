{ pkgs, ... }:
{
  imports = [
    # ./polonium.nix
#     ./krohnkite.nix
#     ./rounded_corners.nix
    ./okular.nix
  ];

  # programs.kate = {
  #   enable = true;
  #   package = null;
  # };

  programs.plasma = {
    enable = true;
    
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    configFile = {
      kcminputrc.Keyboard.NumLock = 0;

      kwinrc = {
        # Activate nightcolor, located at Brussels
        NightColor = {
          Active = true;
          Mode = "Location";
          LatitudeFixed = 51.85;
          LongitudeFixed = 3.34;
        };

        # Make focus follow the mouse
        Windows = {
          FocusPolicy = "FocusFollowsMouse";
        };

        # Show windows from all workspaces
        TabBox.DesktopMode = 0;

        # Scaling
        # FIXME: would be better to have 1.25, but
        # rounded corners are then blurry :(
#         Xwayland.Scale = 1;

        Plugins = {
          shakecursorEnabled = true;
          wobblywindowsEnabled = true;
        };
      };

      # Make Capslock act as Esc
      kxkbrc.Layout = {
        Options = "caps:escape_shifted_capslock";
        ResetOldOptions = true;
      };

      # Auto mount of external drives
      kded5rc.Module-device_automounter.autoload = true;

      # FIXME: Maybe change it somewhere else?
      kdeglobals.General = {
        TerminalApplication = "alacritty";
        TerminalService = "Alacritty.desktop";
        UseSystemBell = true;
      };
    };

    shortcuts = {
      # Conflict with tiling Focus Right (Meta+L)
#       ksmserver."Lock Session" = "Screensaver";

      # Alacritty as terminal
      "services/Alacritty.desktop"."New" = "Ctrl+Alt+T";
      "services/org.kde.konsole.desktop"."_launch" = [ ];
    };
  };
}
