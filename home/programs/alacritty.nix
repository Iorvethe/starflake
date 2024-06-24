{
  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "zellij";
        args = [ "-l" "welcome" ];
      };
    };
  };
}
