{
  programs.fish.shellAliases = {
    # General
    c = "clear";
    cat = "bat";
    e = "exit";
    pk = "pkill";

    # File Management
    ls = "lsd --group-dirs first";

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

    # NPM 
    ni = "npm install --save";
    nisd = "npm install --save-dev";
    nrb = "npm run build";
    nrd = "npm run dev";
    nrs = "npm run start";
    nun = "npm uninstall";

    # PNPM 
    pni = "pnpm install --save";
    pnisd = "pnpm install --save-dev";
    prb = "pnpm run build";
    prd = "pnpm run dev";
    prs = "pnpm run start";
    pun = "pnpm uninstall";

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
    nvtemp = "nvidia-smi -q -d temperature --format=csv,noheader,nounits";
    nvutil = "nvidia-smi --query-gpu=utilization.gpu --format=csv";

    # NIX
    hm-rebuild = "home-manager switch -b backup --flake .";
    hm-rebuild-stylix = "home-manager switch -b backup --flake . && ~/.swww-stylix";
    nix-rebuild = "sudo nixos-rebuild switch --flake .#default";
    sys-gens = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
  };
}
