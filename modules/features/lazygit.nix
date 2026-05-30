{
  flake.modules.homeManager.lazygit = {lib, ...}: {
    programs.lazygit = {
      enable = true;
      settings = lib.mkForce {
        disableStartupPopups = true;
        notARepository = "skip";
        promptToReturnFromSubprocess = false;
        update.method = "never";
        git = {
          commit.signOff = false;
          parseEmoji = true;
        };
        gui = {
          showListFooter = false;
          showRandomTip = false;
          showCommandLog = false;
          showBottomLine = false;
          nerdFontsVersion = "3";
        };
      };
    };
  };
}
