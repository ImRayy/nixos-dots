{self, ...}: {
  flake.lib = {
    loadNixosAndHmModuleForUser = username: modules:
      assert builtins.isList modules;
        (builtins.map (module: self.modules.nixos.${module} or {}) modules)
        ++ [
          {
            home-manager.users.${username}.imports =
              builtins.map (
                module: self.modules.homeManager.${module} or {}
              )
              modules;
          }
        ];
  };
}
