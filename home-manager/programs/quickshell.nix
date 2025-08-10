{
  inputs,
  unstablePkgs,
  ...
}: {
  home.packages = with unstablePkgs;
    [
      inputs.quickshell.packages."${system}".default
      app2unit #  Desktop entry launcher
      cliphist # Clipboard daemon
      dash # To launch app a little faster with app2unit
      hyprpicker # Color picker
      hyprshade # NightLight
      zenity # File picker
      matugen # Material color generator
    ]
    ++ (with kdePackages; [
      qtdeclarative
    ]);
}
