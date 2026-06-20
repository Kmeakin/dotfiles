{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs =
    {
      self,
      nix-darwin,
      nix-homebrew,
      nixpkgs,
    }:
    let
      configuration = { pkgs, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages = [
          pkgs.aria2
          pkgs.atool
          pkgs.bat
          pkgs.binutils
          pkgs.cargo-benchcmp
          pkgs.clang
          pkgs.clang-tools
          pkgs.cmake
          pkgs.coreutils
          pkgs.delta
          pkgs.discord
          pkgs.dust
          pkgs.emacs
          pkgs.eza
          pkgs.fastfetch
          pkgs.fd
          pkgs.firefox
          pkgs.fish
          pkgs.gcc
          pkgs.gdb
          pkgs.gh
          pkgs.ghostty-bin
          (pkgs.git.override { osxkeychainSupport = false; }) # HACK: https://github.com/nix-darwin/nix-darwin/issues/1643
          pkgs.gnugrep
          pkgs.gnumake
          pkgs.gnupg
          pkgs.gnuplot
          pkgs.htop
          pkgs.hyperfine
          pkgs.iterm2
          pkgs.jq
          pkgs.jujutsu
          pkgs.just
          pkgs.lazygit
          pkgs.libiconv
          pkgs.lld
          pkgs.llvm
          pkgs.neovim
          pkgs.nh
          pkgs.nixfmt
          pkgs.openssh
          pkgs.pass
          pkgs.python3
          pkgs.ranger
          pkgs.ripgrep
          pkgs.rustup
          pkgs.slack
          pkgs.spotify
          pkgs.stow
          pkgs.taplo
          pkgs.tokei
          pkgs.tree
          pkgs.uv
          pkgs.yazi
          pkgs.zoom-us
          pkgs.nil
          pkgs.nixd
        ];

        environment.shells = [ pkgs.fish ];

        # HACK: https://github.com/ghostty-org/ghostty/discussions/2832
        environment.variables.XDG_DATA_DIRS = [ "$GHOSTTY_SHELL_INTEGRATION_XDG_DIR" ];

        # HACK: https://github.com/rust-lang/rust/issues/112501
        environment.variables.CARGO_TARGET_AARCH64_APPLE_DARWIN_LINKER = "/usr/bin/cc";

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";
        # nix.package = pkgs.lixPackageSets.stable.lix;

        # Enable alternative shell support in nix-darwin.
        programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 6;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";
        nixpkgs.config.allowUnfree = true;

        security.pam.services.sudo_local.touchIdAuth = true;

        system.primaryUser = "karmea01";

        system.defaults.CustomUserPreferences = {
          "org.hammerspoon.Hammerspoon".MJConfigFile = "~/.config/hammerspoon/init.lua";
        };

        nix-homebrew = {
          enable = true;
          enableRosetta = true;
          user = "karmea01";
          autoMigrate = true;
        };
        homebrew = {
          enable = true;
          enableFishIntegration = true;
          brews = [ ];
          casks = [
            "hammerspoon"
            "hot"
            "keycombiner"
            "visual-studio-code"
            "thunderbird"
          ];
        };
      };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#K0VNMGXHCJ-3
      darwinConfigurations."K0VNMGXHCJ-3" = nix-darwin.lib.darwinSystem {
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          configuration
        ];
      };
    };

}
