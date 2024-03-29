# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/sda";

  # allow unfree
  nixpkgs.config.allowUnfree = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp2s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
   i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "us";
     defaultLocale = "en_US.UTF-8";
   };

  # Set your time zone.
   time.timeZone = "Europe/Kiev";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";
######
  # Enable touchpad support.
  # services.xserver.libinput.enable = true;
  services.xserver.windowManager = {
    default = "xmonad";
  #  xterm.enable = false;
  #  xfce.enable = true;
  };
  #services.compton.enable = true;
######
    # Enable xmonad and include extra packages
    services.xserver.windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad
	haskellPackages.xmobar
     ];
    };
    services.xserver.desktopManager.xterm.enable = false;
    services.xserver.desktopManager.default = "none";
    services.xserver.displayManager = {
      slim = {
	enable = true;
	defaultUser = "dotsenko";
      };
    };
    services.xserver = {
	  videoDrivers = [ "intel" ];                                                                                                                                                                        
	  deviceSection = ''                                                                            
	    Option "DRI" "2"                                                                            
	    Option "TearFree" "true"                                                                    
	  '';
    };
    # Use lightdm
#    services.xserver.displayManager.lightdm = {
#      enable = true;
#      greeters.gtk.indicators = [ "~host" "~spacer" "~clock" "~spacer" "~a11y" "~session" "~power"];
#    };
  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };

  environment.systemPackages = with pkgs; [
    ##### system
    ### tools
    wget
    git
    htop
    unzip
    st
    spaceFM
    pv
    transmission-gtk
    
    ### xmonad
    xmobar
    polybar
    
    ### user
    firefox
    vlc
    redshift
    galculator
        
    ##### work
    ### IDE
    sublime3
    sublime-merge
    vscodium
    jetbrains.idea-community
    jetbrains.pycharm-community
    android-studio
    dbeaver
    
    ### tools
    virtualbox
    docker
    glogg
    megasync
    cherrytree
    
    ### messengers
    skypeforlinux
    tdesktop
    viber

  ];

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}

