{
  programs.thunderbird = {
    enable = true;
    profiles.ULB = {
      isDefault = true;
      settings = {
        # Use XDG file picker
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };
  };
}
