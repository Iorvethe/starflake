{ pkgs, ... }:
{
  imports = [
    # ./polonium.nix
#     ./krohnkite.nix
#     ./rounded_corners.nix
    ./startup.nix
    ./okular.nix
  ];

  # programs.kate = {
  #   enable = true;
  #   package = null;
  # };

  programs.plasma = {
    enable = true;

    input = {
      keyboard = {
        numlockOnStartup = "on";
        options = [
          # Make Capslock act as Esc
          "caps:escape_shifted_capslock"
        ];
        layouts = [
          {
            layout = "fr";
            variant = "bepo_afnor";
          }
          {
            layout = "bg";
            variant = "bas_phonetic";
          }
          {
            layout = "us";
          }
        ];
      };
    };
    
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    kwin = {
      effects = {
        shakeCursor.enable = true;
        wobblyWindows.enable = false;
      };
      nightLight = {
        enable = true;
        mode = "location";
        location = {
          # Brussels
          latitude = "50.85045000";
          longitude = "4.34878000";

          # Veliko Tarnovo
          # latitude = "43.077778";
          # longitude = "25.616667";
        };
      };
    };

    krunner = {
      position = "center";
      historyBehavior = "enableAutoComplete";
    };

    configFile = {

      kwinrc = {
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
