{ themes, ... }:
{
  xdg.configFile."alacritty/themes" = {
    recursive = true;
    source = "${themes.alacritty}/dist";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      import = ["~/.config/alacritty/themes/rose-pine-moon.toml"];
      cursor.style = {
        shape = "Beam";
      };
      mouse.hide_when_typing = true;
      shell = {
        # program = "fish";
        program = "zellij";
        args = [ "-l" "welcome" ];
      };
      font = {
        normal.family = "IosevkaTerm Nerd Font";
      };
      window = {
        padding = {
          x = 5;
          y = 5;
        };
        dynamic_padding = true;
      };
    };
  };
}
