{ pkgs, ... }:

let
  src = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "alacritty";
    rev = "3c3e36eb5225b0eb6f1aa989f9d9e783a5b47a83";
    hash = "sha256-LU8H4e5bzCevaabDgVmbWoiVq7iJ4C1VfQrWGpRwLq0=";
  };
in {
  home.file.".config/alacritty/themes" = {
    recursive = true;
    source = "${src}/dist";
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
    };
  };
}
