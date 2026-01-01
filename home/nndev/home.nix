{ config, pkgs, ... }:

{
  home.username = "nndev";
  home.homeDirectory = "/home/nndev";
  home.stateVersion = "25.11"; # Samakan dengan configuration.nix

  home.packages = with pkgs; [
    # Development
    php83
    php83Packages.composer
    nodejs_20
    git
    gh # github cli
    google-chrome
    # Editors & Tools
    vscode
    neovim
    nil # Nix language server
    pavucontrol
    discord
    gnome-tweaks
 ];

  programs.git = {
    enable = true;
    # Cara lama (userName/userEmail) sudah mulai ditinggalkan di versi terbaru
    # Gunakan cara baru di bawah ini jika warning masih muncul:
    settings = {
      user = {
        name = "anandamw";
        email = "anandamw.dev@gmail.com";
      };
    };
  };
  

  programs.ssh = {
    enable = true;
    # Mematikan config default agar tidak ada warning lagi
    enableDefaultConfig = false;

    matchBlocks = {
      # Pengaturan global untuk SEMUA host
      "*" = {
        addKeysToAgent = "yes";
      };
      # Pengaturan spesifik untuk GitHub
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  programs.home-manager.enable = true;
}
