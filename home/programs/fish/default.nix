{ themes, ... }:
{
  xdg.configFile."fish/themes" = {
    recursive = true;
    source = "${themes.fish}/themes";
  };

  programs.fish = {
    enable = true;

    shellInitLast = ''
      fish_config theme choose "Rosé Pine Moon"
      set -g fish_greeting
    '';

    functions = {
      mkcd = "mkdir $argv[1] && cd $argv[1]";
    };
  };
}
