|![image1](https://ik.imagekit.io/rayshold/dotfiles/hyprland-gruvbox.png?updatedAt=1730741432239)|
|---|

|![image2](https://ik.imagekit.io/rayshold/dotfiles/ags/2024-11-04-134310_hyprshot.png?updatedAt=1730733654687)|![image3](https://ik.imagekit.io/rayshold/dotfiles/ags/2024-11-04-133932_hyprshot.png?updatedAt=1730733654956)|
|---|---|

## Applications

- [hyprland](https://hyprland.org/) - Compositor/WindowManager
- [ags](https://github.com/Aylur/ags) [current], [waybar](https://github.com/Alexays/Waybar) - top bar
- [rofi](https://github.com/lbonn/rofi) - app-launcher, clipboard manager, powermenu
- [smile](https://github.com/mijorus/smile) - emoji picker
- [foot](https://codeberg.org/dnkl/foot)
- [yazi](https://github.com/sxyazi/yazi) - TUI file explorer, [nautilua](https://apps.gnome.org/en-GB/Nautilus/) - GUI file explorer
- [neovim](https://github.com/neovim/neovim), [neovide](https://github.com/neovide/neovide) - TUI & GUI text editor

- Check [`home-manager/programs.nix`](https://github.com/ImRayy/nixos-dots/blob/master/home-manager/programs.nix) & [`system/programs.nxi`](https://github.com/ImRayy/nixos-dots/blob/master/system/programs.nix) for other installed applications

## Keybindings

**Window Management**

| Keys | Action |
| -------------- | --------------- |
| `Super` + `Q` | Kill active & focused window|
| `Super` + `Space` | Toggle floating window|  
| `Super` + `F` | Toggle Fullscreen |
| `Super` + `P` | Pin the active floating window |
| `Super` + `C` | Center the active floating window  |
| `Super` + `RightClick` | Resize winodw |
| `Super` + `LeftClick` | Move winodw|
| `Super` + `W` `A` `S` `D`  | swich focus around active window|
| `Super` + `Shift` + `W` `A` `S` `D`  | Move active window |

**Special Window/Scratchpad**

| Keys | Action |
| -------------- | --------------- |
| `Super` + `S`  | Toggle SpecialWorkspace/Scratchpad |
| `Super` + `Shft` + `S` | Move window to SpecialWorkspace |

**Group**

| Keys | Action |
| -------------- | --------------- |
| `Super` + `G` | Toggles the current active window into a group |
| `Super` + `Shift` + `G`   | Locks the groups|
| `Alt` + `Shift` + `H`   | switches to the previous window|
| `Alt` + `Shift` + `L`   | switches to the next window|

**Application Shortcuts**

| Keys | Action |
| -------------- | --------------- |
| `Super` + `Enter`   | Foot terminal |
| `Super` + `E`   | Emoji picker |
| `Super` + `Shift`  + `Enter`   | GUI file explorer |

**Widgets**

|Keys | Action|
|---|---|
| `Super` + `A`   | Application launcher |
| `Super` + `V`   | Clipboard picker |
| `Super` + `N`   | Notification Pannel |
| `Super` + `W`   | Wallpaper Picker |
| `Super` + `X`   | Powermenu |

**Workspaces**

| Keys | Action |
| -------------- | --------------- |
| `Super` + `[1-5]`  | Switch workspace [0-5]|
| `Super` + `Shift` + `[1-5]`    | Move workspace to [0-5]  |
