{ config, pkgs, pkgs-unstable, ... }:
let
  environmentVariables = {
    SHELL = "fish";
    EDITOR = "hx";
  };
in
{
  # User details
  home.username = "borisp";
  home.homeDirectory = "/home/borisp";

  # For TUI programs
  home.sessionVariables = environmentVariables;

  # For GUI programs
  systemd.user.settings.Manager.DefaultEnvironment = environmentVariables;

  imports = [
    ./home
  ];

  # Packages
  home.packages = with pkgs; [
    # CLI
    neofetch
    just
    julia
    wl-clipboard

    # Security
    keepassxc

    # E-books
    calibre
    foliate

    # Graphics
    krita
    inkscape
    blender
    haruna
    godot_4
    pkgs-unstable.rnote

    # Social
    vesktop # Discord with screen sharing on Wayland

    # Cloud
    nextcloud-client

    # Learning
    anki

    # KDE packages
    kdePackages.qtmultimedia # For fokus
    kdePackages.filelight
    kdePackages.ktorrent
    kdePackages.isoimagewriter
    kdePackages.neochat
    kdePackages.skanpage
    kdePackages.kdenlive

    # For spellchecking
    aspell
    aspellDicts.fr
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science

    # Download
    yt-dlp

    # Research
    pkgs-unstable.zotero

    # Office
    libreoffice

    # LSP servers
    clang-tools

    # Archiving
    p7zip

    # Legion
    # lenovo-legion

#     kdePackages.akonadi
#     kdePackages.kdepim-runtime
#     kdePackages.kaccounts-providers
#     kdePackages.kaccounts-integration
#     kdePackages.qtwebengine # For online accounts

#     pixelorama

    # Photography
    # kdePackages.kamera
#     digikam
#     exiftool
  ];

#   fonts.fontconfig.enable = false;

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

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };

  home.file.".XCompose".source = ./XCompose;

  # xdg.mimeApps.defaultApplications = {
  #   "application/epub+zip" = [ "com.github.johnfactotum.Foliate.desktop" ];
  #   "x-mobipocket-ebook" = [ "com.github.johnfactotum.Foliate.desktop" ];
  #   "vnd.amazon.mobi8-ebook" = [ "com.github.johnfactotum.Foliate.desktop" ];
  # };

  # programs.thunderbird = {
  #   enable = true;
  # };

  # home.filec

  # Pin version to which configuration is compatible with
  # to avoid breakage on backwards incompatible changes
  home.stateVersion = "24.05";

  # Let home-manager manage itself
  programs.home-manager.enable = true;
}
