{ config, pkgs, ... }:

{
    services.xserver = {
        displayManager.sddm = {
            enable = true;
            wayland.enable = true;
            theme = "${import ../themes/sddm-theme.nix { inherit pkgs; }}";
        };
    };
}
