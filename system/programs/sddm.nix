{ config, pkgs, ... }:

{
    services.xserver = {
        displayManager.sddm.enable = true;
        displayManager.sddm.theme = "${import ../themes/sddm-theme.nix { inherit pkgs; }}";

    };
}
