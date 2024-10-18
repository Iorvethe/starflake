{pkgs, ...}:
{
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird-128;
    profiles.ULB = {
      isDefault = true;
      settings = {
        # Use XDG file picker
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };
  };
}
