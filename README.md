![image1](https://ik.imagekit.io/rayshold/dotfiles/hyprland-gruvbox-02.png)
![image2](https://ik.imagekit.io/rayshold/dotfiles/ags/wallpaper-picker-v2.webp)

## Applications

- [Hyprland](https://hyprland.org/) - compositor/window-manager
- [Quickshell](https://quickshell.outfoxxed.me/) - top bar, Launcher, Notificatons
- [Smile](https://github.com/mijorus/smile) - emoji picker
- [Kitty](https://github.com/kovidgoyal/kitty) - terminal
- [Yazi](https://github.com/sxyazi/yazi) - TUI file explorer, [Nautilus](https://apps.gnome.org/en-GB/Nautilus/) - GUI file explorer
- [Neovim](https://github.com/neovim/neovim), [Neovide](https://github.com/neovide/neovide) - TUI & GUI text editor

**Other Apps**: These are available, but I don't actively use. Can be enabled in `config.nix`

- [Kitty](https://github.com/kovidgoyal/kitty) - terminal for wayland/x11
- [Qtile](https://github.com/qtile/qtile) - window-manager for wayland/x11
- [Dunst](https://github.com/dunst-project/dunst) - notificaton daemon, again wayland/x11

Check [`home-manager/programs.nix`](https://github.com/ImRayy/nixos-dots/blob/master/home-manager/programs.nix) & [`system/programs.nxi`](https://github.com/ImRayy/nixos-dots/blob/master/system/programs.nix) for other installed applications

## Installation

**Rebuild System**

```bash
cd nixos-dots/
sudo nixos-rebuild switch --flake .#default
```

**Rebuild home-manager**

```bash
cd nixos-dots/
home-manager switch -b backup --flake .
```

---

<details>
  <summary>In case you don't have home-manager installed
</summary>
  
#### Install home-manager as standalone...

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

One common error I often face while installing home-manager...

```bash
error: file 'home-manager' was not found in the Nix search path (add it using $NIX_PATH or -I)
```

To fix this

```bash
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

# And then run
nix-shell '<home-manager>' -A install
```

</details>

> [!NOTE]
> Quickshell dotfiles are not directly included in this repo, as managing them would be a hassle and I'm too lazy for that. Instead, I manage my ags dots in a separate repo and used that as a flake input in `flake.nix`. To sync with the latest changes, do a quick `nix flake update shell` before rebuilding home configuration, same goes for `qtile`.

## Keybindings

**Window Management**

| Keys                                | Action                            |
| ----------------------------------- | --------------------------------- |
| `Super` + `Q`                       | Kill active & focused window      |
| `Super` + `Space`                   | Toggle floating window            |
| `Super` + `F`                       | Toggle Fullscreen                 |
| `Super` + `P`                       | Pin the active floating window    |
| `Super` + `C`                       | Center the active floating window |
| `Super` + `RightClick`              | Resize winodw                     |
| `Super` + `LeftClick`               | Move winodw                       |
| `Super` + `W` `A` `S` `D`           | swich focus around active window  |
| `Super` + `Shift` + `W` `A` `S` `D` | Move active window                |

**Special Window/Scratchpad**

| Keys                   | Action                             |
| ---------------------- | ---------------------------------- |
| `Super` + `S`          | Toggle SpecialWorkspace/Scratchpad |
| `Super` + `Shft` + `S` | Move window to SpecialWorkspace    |

**Group**

| Keys                    | Action                                         |
| ----------------------- | ---------------------------------------------- |
| `Super` + `G`           | Toggles the current active window into a group |
| `Super` + `Shift` + `G` | Locks the groups                               |
| `Alt` + `Shift` + `H`   | switches to the previous window                |
| `Alt` + `Shift` + `L`   | switches to the next window                    |

**Application Shortcuts**

| Keys                        | Action            |
| --------------------------- | ----------------- |
| `Super` + `Enter`           | Kitty terminal    |
| `Super` + `E`               | Emoji picker      |
| `Super` + `Shift` + `Enter` | GUI file explorer |

**Widgets**

| Keys          | Action               |
| ------------- | -------------------- |
| `Super` + `A` | Application launcher |
| `Super` + `V` | Clipboard picker     |
| `Super` + `N` | Notification Pannel  |
| `Super` + `W` | Wallpaper Picker     |
| `Super` + `X` | Powermenu            |

**Workspaces**

| Keys                        | Action                  |
| --------------------------- | ----------------------- |
| `Super` + `[1-5]`           | Switch workspace [0-5]  |
| `Super` + `Shift` + `[1-5]` | Move workspace to [0-5] |
