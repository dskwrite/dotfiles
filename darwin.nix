{ pkgs, ... }: {

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.variables = {
    XDG_CONFIG_HOME = "$HOME/.config";
  };

  #TODO: remove user hardcoding
  users.users.dsk = {
    name = "dsk";
    home = "/Users/dsk"; 
  };


  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
  ];

  environment.variables.HOMEBREW_NO_ANALYTICS = "1";
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    brews = [
      "azure-cli"
    ];
    casks = [
      "1password"
      "1password-cli"
      "alt-tab"
      "arc"
      #"customshortcuts"
      "discord"
      #docker
      #figma
      "karabiner-elements"
      "logi-options+"
      "microsoft-edge"
      "microsoft-teams"
      "miro"
      "notion"
      "obsidian"
      #"pocket-casts"
      #"raindropio
      "raycast"
      #"reader"
      "setapp"
			"shottr"
      "visual-studio-code"
      "vscodium"
      "zoom"
    ];
    masApps = {
      _1PasswordforSafari = 1569813296;
      #AffinityDesigner = 824171161;
      #AffinityPhoto = 824183456;
      #ColorSlurp = 1287239339;
      CommandX = 6448461551;
      #Cubox = 1113361350;
      #CuboxForSafari = 1550721541;
      #DaisyDisk = 411643860;
      HiddenBar = 1452453066;
      Kindle = 302584613;
      MicrosoftExcel = 462058435;
      MicrosoftOutlook = 985367838;
      MicrosoftPowerPoint = 462062816;
      MicrosoftWord  = 462054704;
      #MirrorMagnet = 1563698880;
      mymind = 1532801185;
      ObsidianWebClipper = 6720708363;
      OneDrive = 823766827;
      Perplexity = 6714467650;
      #PurePaste = 1611378436;
      SaveToReaderForSafari = 1640236961;
      #Sleeve = 1606145041;
      #Slack = 803453959;
      Todoist = 585829637;
      Velja = 1607635845;
      WindowsApp = 1295203466;
    };
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Allows sudo permissions with Touch ID
  security.pam.enableSudoTouchIdAuth = true;

  system.defaults = {
    controlcenter = {
      BatteryShowPercentage = true;
      NowPlaying = false;
    };
    dock = {
      autohide = true;
      largesize = 96;
      magnification = true;
      static-only = true;
      tilesize = 24;
    };
    finder = {
      _FXShowPosixPathInTitle = true;
      _FXSortFoldersFirst = true;
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "Nlsv";
      QuitMenuItem = true;
      ShowPathbar = true;
      ShowStatusBar = true;
    };
    trackpad.Clicking = true;
    CustomUserPreferences = {
      "com.apple.Safari" = {
        AlwaysRestoreSessionAtLaunch = true;
        AutoFillCreditCardData = false;
        AutoFillFromAddressBook = false;
        AutoFillMiscellaneousForms = false;
        AutoFillPasswords = false;
        FindOnPageMatchesWordStartsOnly = false;
        InstallExtensionUpdatesAutomatically = true;
        ShowFullURLInSmartSearchField = true;
      };
      #https://shottr.cc/kb/friendsclub
      "cc.ffitch.shottr" = {
        fileNameTemplate = "%Y-%m-%d-%H%M%S-%n";
        growingToolbar = 1;
        showDockIcon = 2009463689;
			};
    };
    NSGlobalDomain = {
      "com.apple.keyboard.fnState" = true; #function keys as standard function keys
      "com.apple.mouse.tapBehavior" = 1; #enable tap to click
      "com.apple.trackpad.scaling" = 3.0; #trackpad speed
      AppleKeyboardUIMode = 3;
      AppleShowAllExtensions = true; # Finder: show file extensions 
      AppleShowAllFiles = true; # Finder: show all files
      NSAutomaticSpellingCorrectionEnabled = false; # disable auto-correct
    };
  };

}