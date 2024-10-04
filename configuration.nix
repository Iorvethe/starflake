# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Grub bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;  # Discover Windows boot
      configurationLimit = 10;  # Generations kept in boot
    };
    # systemd-boot.enable = true;
  };

  boot.tmp.cleanOnBoot = true;
  boot.extraModulePackages = [
    config.boot.kernelPackages.lenovo-legion-module
  ];

  networking.hostName = "saturn"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  # time.timeZone = "Europe/Sofia";
  time.timeZone = "Europe/Brussels";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_BE.UTF-8";
    LC_IDENTIFICATION = "fr_BE.UTF-8";
    LC_MEASUREMENT = "fr_BE.UTF-8";
    LC_MONETARY = "fr_BE.UTF-8";
    LC_NAME = "fr_BE.UTF-8";
    LC_NUMERIC = "fr_BE.UTF-8";
    LC_PAPER = "fr_BE.UTF-8";
    LC_TELEPHONE = "fr_BE.UTF-8";
    LC_TIME = "fr_BE.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;

#   # Enable OpenGL
#   hardware.opengl = {
#     enable = true;
#     driSupport = true;
#     driSupport32Bit = true;
#   };

#   # Nvidia drivers
#   services.xserver.videoDrivers = [ "nvidia" ];

#   hardware.nvidia = {

#     # Modesetting is required.
#     modesetting.enable = true;

#     # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
#     # Enable this if you have graphical corruption issues or application crashes after waking
#     # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
#     # of just the bare essentials.
#     powerManagement.enable = false;

#     # Fine-grained power management. Turns off GPU when not in use.
#     # Experimental and only works on modern Nvidia GPUs (Turing or newer).
#     powerManagement.finegrained = false;

#     # Use the NVidia open source kernel module (not to be confused with the
#     # independent third-party "nouveau" open source driver).
#     # Support is limited to the Turing and later architectures. Full list of
#     # supported GPUs is at:
#     # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
#     # Only available from driver 515.43.04+
#     # Currently alpha-quality/buggy, so false is currently the recommended setting.
#     open = false;

#     # Enable the Nvidia settings menu,
# 	# accessible via `nvidia-settings`.
#     nvidiaSettings = true;

#     prime = {
#       sync.enable = true;
#       amdgpuBusId = "PCI:6:0:0";
#       nvidiaBusId = "PCI:1:0:0";
#     };

#     # Optionally, you may need to select the appropriate driver version for your specific GPU.
# #     package = config.boot.kernelPackages.nvidiaPackages.stable;
#   };

#   specialisation = {
#     on-the-go.configuration = {
#       system.nixos.tags = [ "on-the-go" ];
#       hardware.nvidia = {
#         prime.offload.enable = lib.mkForce true;
#         prime.offload.enableOffloadCmd = lib.mkForce true;
#         prime.sync.enable = lib.mkForce false;
#       };
#     };
#   };

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "bepo_afnor";
  };

  # Configure console keymap
  console.useXkbConfig = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  # Optimise storage, same as `nix-store --optimise`
  nix.settings.auto-optimise-store = true;

  # services.ntp.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.borisp = {
    isNormalUser = true;
    description = "Boris Petrov";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
#       godot_4

      # Discord with screen sharing on Wayland
#       vesktop
      # discord
      # xwaylandvideobridge
      # webcord

#       haruna
    #  thunderbird
    ];
  };

  programs.nix-ld = {
    enable = true;
  };

  # Install firefox.
  programs.firefox = {
    enable = true;
    preferences = {
       # Usability
       "browser.ctrlTab.sortByRecentlyUsed" = true;
       "widget.use-xdg-desktop-portal.file-picker" = 1;

       # Restore previous session
       "browser.startup.page" = 3;
    };
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value= true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      OfferToSaveLogins = false;
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "newtab"; # alternatives: "always" or "never"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"
      # SearchEngines = {
      #   Default = "DuckDuckGo";
      #   Remove = ["Google"];
      # };
      ExtensionSettings = {
        # "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # Privacy Badger:
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
        };
        # KeepassXC:
        "keepassxc-browser@keepassxc.org" = {
          install_url = "https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/latest.xpi";
          installation_mode = "force_installed";
        };
        # Plasma integration
        "plasma-browser-integration@kde.org" = {
          install_url = "https://addons.mozilla.org/en-US/firefox/addon/plasma-integration/latest.xpi";
          installation_mode = "force_installed";
        };
        # # Augmented steam:
        # "uBlock0@raymondhill.net" = {
        #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        #   installation_mode = "force_installed";
        # };
      };
    };

  };

  programs.kdeconnect = {
    enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
#       kdePackages.kamera
#       wl-clipboard
#       unrar # For cbz on okular
      # llvmPackages_18.libcxxClang
      # clang-tools_18
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  # Fonts configuration
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "IosevkaTerm" ]; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
