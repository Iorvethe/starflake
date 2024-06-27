{ config, pkgs, ... }:

{
  # User details
  home.username = "borisp";
  home.homeDirectory = "/home/borisp";

  home.sessionVariables = {
    SHELL = "fish";
  };

  systemd.user.settings.Manager.DefaultEnvironment = {
    SHELL = "fish";
  };

  imports = [
    ./home
  ];

  # Packages
  home.packages = with pkgs; [
    kdePackages.akonadi
    kdePackages.kdepim-runtime
    kdePackages.kaccounts-providers
    kdePackages.kaccounts-integration
    kdePackages.qtwebengine
    neofetch
    keepassxc
    pixelorama
    just
  ];

  # FIXME: plasma and extensions don’t work
  # programs.firefox = {
  #   enable = true;

  #   profiles.default = {
  #      id = 0;
  #      isDefault = true;

  #     # nativeMessagingHosts = [
  #     #   pkgs.plasma-browser-integration
  #     #   # pkgs.keepassxc
  #     # ];

  #     #  extensions = with config.nur.repos.rycee.firefox-addons; [
  #     #   plasma-integration
  #     #   ublock-origin
  #     #   keepassxc-browser
  #     # ];

  #      search = {
  #        default = "DuckDuckGo";
  #        force = true;
  #        engines = {
  #          "Nix Packages" = {
  #            urls = [{
  #              template = "https://search.nixos.org/packages";
  #              params = [
  #                { name = "type"; value = "packages"; }
  #                { name = "query"; value = "{searchTerms}"; }
  #              ];
  #            }];

  #            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
  #            definedAliases = [ "@np" ];
  #          };

  #          "NixOS Wiki" = {
  #            urls = [{ template = "https://wiki.nixos.org/index.php?search={searchTerms}"; }];

  #            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
  #            definedAliases = [ "@nw" ];
  #          };

  #          "Bing".metaData.hidden = true;
  #          "eBay".metaData.hidden = true;
  #        };
  #      };

  #      settings = {
  #        # Usability
  #        "browser.ctrlTab.sortByRecentlyUsed" = true;
  #        "widget.use-xdg-desktop-portal.file-picker" = 1;

  #        # Restore previous session
  #        "browser.startup.page" = 3;
  #      };
  #   };
  # };

   # programs.librewolf = {
   #   enable = true;
   #   # package = (pkgs.librewolf.override { extraNativeMessagingHostst = [ pkgs.kdePackages.plasma-browser-integration ]; });
   #   settings = {
   #     # Usability
   #     "browser.ctrlTab.sortByRecentlyUsed" = true;
   #     "widget.use-xdg-desktop-portal.file-picker" = 1;

   #     # Restore previous session
   #     "browser.startup.page" = 3;
   #     "privacy.clearOnShutdown.history" = false;
   #   };
   # };


  # programs.thunderbird = {
  #   enable = true;
  # };

  # programs.fish = {
  #   enable = true;
  # };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  # programs.starship = {
  #   enable = true;
  #   enableFishIntegration = true;
  # };

  # home.filec

  # Pin version to which configuration is compatible with
  # to avoid breakage on backwards incompatible changes
  home.stateVersion = "24.05";

  # Let home-manager manage itself
  programs.home-manager.enable = true;
}
