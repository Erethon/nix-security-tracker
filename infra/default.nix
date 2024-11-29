{ lib, pkgs, config, ... }: {
  environment.systemPackages = with pkgs; [ curl git htop lsof tmux tree vim ];
  services.openssh.enable = true;
  users.users.root = {
    openssh.authorizedKeys.keyFiles = with lib;
      map (n: ./keys/${n}) (attrNames (builtins.readDir ./keys));
  };
}
