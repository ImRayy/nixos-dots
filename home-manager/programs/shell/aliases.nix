let
  nixprofile_path = "/nix/var/nix/profiles/system";
in {
  # General
  c = "clear";
  cat = "bat";
  e = "exit";
  pk = "pkill";

  # File Management
  ls = "eza --group-directories-first --icons";
  tree = "eza --tree";
  lf = "yazi";

  # Note editor
  nvide = "neovide";

  #Github
  lz = "lazygit";

  # Trash: trash-cli
  rm = "trash-put";
  tre = "trash-empty";
  trl = "trash-list";
  trp = "trash-put";
  trr = "trash-restore";

  # GPG
  encrypt = "gpg --encrypt --armor --sign -r";
  decrypt = "gpg --decrypt";
  public-keys = "gpg --list-public-keys";
  secret-keys = "gpg --list-secret-keys";
  all-keys = "gpg --list-keys";

  # GPU
  nv = "nvidia-smi";
  nvgpu = "nvidia-smi --query-gpu=gpu_name --format=csv,noheader,nounits";
  nvmem = "nvidia-smi --query-gpu=memory.used --format=csv";
  nvtemp = " nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits";
  nvutil = "nvidia-smi --query-gpu=utilization.gpu --format=csv";

  # NIX
  hms = "home-manager switch -b backup --flake .";
  nix-rebuild = "sudo nixos-rebuild switch --flake .#default";
  nixos-gens = "sudo nix-env --list-generations --profile ${nixprofile_path}";
  nixos-gens-rm = "sudo nix-env --profile ${nixprofile_path} --delete-generations";

  # Docker
  dcud = "docker compose up -d";
  dcd = "docker compose down";

  # Misc
  font-list = "fc-list : family | fzf | tr -d '\\n'";
  passs = "PASSWORD_STORE_ENABLE_EXTENSIONS=true pass fzf";
}
