{ pkgs, lib, username, ... }: {

  # Auto upgrade nix package and the daemon service.
  #services.nix-daemon.enable = true;

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
    # Use the standard home directory structure for macOS
    XDG_CONFIG_HOME = "/Users/${username}/.config";
  };

  # Use the username variable passed from the flake
  users.users.${username} = {
    name = username;
    # Assuming standard macOS home directory path
    home = "/Users/${username}";
    shell = pkgs.nushell;
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
      "1password" # https://1password.com
      "1password-cli" # https://developer.1password.com/docs/cli/
      "affinity-designer" # https://affinity.serif.com/en-us/designer/
      "affinity-photo" # https://affinity.serif.com/en-us/photo/
      "alt-tab" # https://alt-tab-macos.netlify.app
      "arc" # https://arc.net
      "azure-data-studio" # https://docs.microsoft.com/en-us/sql/azure-data-studio/
      "betterdisplay" # https://github.com/waydabber/BetterDisplay#readme
      "beyond-compare" # https://scootersoftware.com
      "cursor" # https://www.cursor.com/en
      #"customshortcuts" # https://www.houdah.com/customShortcuts/
      "discord" # http://discord.com
      "drawio"
      #docker
      "figma" # https://figma.com
      "ghostty" # https://ghostty.org
      "jordanbaird-ice" # https://icemenubar.app
      "karabiner-elements" # https://karabiner-elements.pqrs.org
      "logi-options+"  # https://www.logitech.com/en-us/software/logi-options-plus.html
      "microsoft-azure-storage-explorer" # https://azure.microsoft.com/en-us/features/storage-explorer/
      "microsoft-edge" # https://www.microsoft.com/en-us/edge
      "microsoft-teams" # https://teams.microsoft.com
      "miro" # https://miro.com
      #"morgen" #https://www.morgen.so
      "notion" # https://notion.so
      "obsidian" # https://obsidian.md
      "orion" # https://kagi.com/orion
      "parallels" # https://parallels.com
      "pocket-casts" # https://pocketcasts.com
      #"raindropio
      "raycast" # https://www.raycast.com
      "reader" # https://readwise.io/read
      "setapp" # https://setapp.com
			"shottr" # https://shottr.cc
      #"sunsama" # https://sunsama.com
      "visual-studio-code" # https://code.visualstudio.com
      "vscodium" # https://vscodium.com
      "windsurf" #https://codeium.com/windsurf
      "zoom" # https://zoom.us
    ];
    masApps = {
      _1PasswordforSafari = 1569813296;
      CommandX = 6448461551; # https://sindresorhus.com/command-x
      DayProgress = 6450280202; # https://sindresorhus.com/day-progress 
      #DaisyDisk = 411643860;
      KagiForSafari = 1622835804; # https://kagi.com
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
      rcmd = 1596283165;
      SaveToReaderForSafari = 1640236961; # https://www.finnvoorhees.com/supercopy
      Sleeve = 1606145041; # https://replay.software/sleeve
      Slack = 803453959;
      Shortery = 1594183810;
      NiceCopy = 6737711441; #https://github.com/marlonjames71/NiceCopy
        # or 
      #SuperCopyForSafari = 6477720316; #https://www.finnvoorhees.com/supercopy
      Todoist = 585829637; # https://www.numberfive.co/detail_shortery.html
      UTCTime = 1538245904; # https://sindresorhus.com/utc-time
      Velja = 1607635845; # https://sindresorhus.com/velja
      WindowsApp = 1295203466; # https://learn.microsoft.com/en-us/windows-app/get-started-connect-devices-desktops-apps?tabs=macos-avd
    };
  };

  fonts.packages = with pkgs; [
    jetbrains-mono # https://www.jetbrains.com/lp/mono/
    pkgs.nerd-fonts.jetbrains-mono # https://www.programmingfonts.org/#jetbrainsmono
  ];

  # Allows sudo permissions with Touch ID
  security.pam.services.sudo_local.touchIdAuth = true;

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
      #"com.apple.Safari" = {
      #  AlwaysRestoreSessionAtLaunch = true;
      #  AutoFillCreditCardData = false;
      #  AutoFillFromAddressBook = false;
      #  AutoFillMiscellaneousForms = false;
      #  AutoFillPasswords = false;
      #  FindOnPageMatchesWordStartsOnly = false;
      #  InstallExtensionUpdatesAutomatically = true;
      #  ShowFullURLInSmartSearchField = true;
      #};
      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          # disable screenshot selection hotkey
          "30" = { enabled = 0; };
          # disable Spotlight hotkey
          "64" = { enabled = 0; };
        };
      };
      #https://shottr.cc/kb/friendsclub
      "cc.ffitch.shottr" = {
        fileNameTemplate = "%Y-%m-%d-%H%M%S-%n";
        growingToolbar = 1;
        showDockIcon = 2009463689;
			};
      # change AltTab hotkey to ⌘ + Tab
      "com.lwouis.alt-tab-macos" = {
        holdShortcut = "\\U2318";
      };
    };
    NSGlobalDomain = {
      "com.apple.keyboard.fnState" = true; #function keys as standard function keys
      "com.apple.mouse.tapBehavior" = 1; #enable tap to click
      "com.apple.trackpad.scaling" = 3.0; #trackpad speed
      AppleKeyboardUIMode = 3;
      AppleShowAllExtensions = true; # Finder: show file extensions 
      AppleShowAllFiles = true; # Finder: show all files
      NSAutomaticCapitalizationEnabled = false; # disable auto-capitalization
      NSAutomaticDashSubstitutionEnabled = false; # disable smart dashes
      NSAutomaticInlinePredictionEnabled = false; # disable inline prediction
      NSAutomaticPeriodSubstitutionEnabled = false; # disable smart periods
      NSAutomaticQuoteSubstitutionEnabled = false; # disable smart quotes
      NSAutomaticSpellingCorrectionEnabled = false; # disable auto-correct
    };
  };

  system.activationScripts.postActivation.text = ''
    sudo nvram StartupMute=%01  # Mute startup chime
    
    #activate system settings that have been changed
    #TODO: look into why this works for some, e.g., disabling Spotlight hotkey, but not for others, e.g., disabling Screenshot hotkey
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

}