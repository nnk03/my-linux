# Common Terminal Keybindings (Readline / Bash / Zsh)

These keybindings mostly follow the **GNU Readline** conventions used in shells like `bash`, `zsh`, and others. Most also work **inside `tmux`**, unless intercepted by `tmux` itself.

## Line Navigation

| Keybinding | Action                        | Works in `tmux` |
| ---------- | ----------------------------- | --------------- |
| `Ctrl + A` | Move to **beginning** of line | ✅              |
| `Ctrl + E` | Move to **end** of line       | ✅              |

## Word Navigation

| Keybinding | Action                     | Works in `tmux`     |
| ---------- | -------------------------- | ------------------- |
| `Alt + B`  | Move **backward** one word | ✅ (may need `Esc`) |
| `Alt + F`  | Move **forward** one word  | ✅ (may need `Esc`) |

## Character Navigation

| Keybinding | Action                          | Works in `tmux`                     |
| ---------- | ------------------------------- | ----------------------------------- |
| `Ctrl + B` | Move **backward** one character | ⚠️ (conflicts with tmux prefix key) |
| `Ctrl + F` | Move **forward** one character  | ✅                                  |

## Deleting

| Keybinding | Action                                     | Works in `tmux`     |
| ---------- | ------------------------------------------ | ------------------- |
| `Ctrl + D` | Delete character under cursor              | ✅                  |
| `Ctrl + H` | Delete character before cursor (backspace) | ✅                  |
| `Ctrl + W` | Delete word before cursor                  | ✅                  |
| `Alt + D`  | Delete word after cursor                   | ✅ (may need `Esc`) |
| `Ctrl + U` | Delete (cut) everything before cursor      | ✅                  |
| `Ctrl + K` | Delete (cut) everything after cursor       | ✅                  |
| `Ctrl + Y` | Paste (yank) last killed text              | ✅                  |

## Undo and Clearing

| Keybinding                  | Action           | Works in `tmux` |
| --------------------------- | ---------------- | --------------- |
| `Ctrl + _`                  | Undo last change | ✅              |
| `Ctrl + X`, then `Ctrl + U` | Undo             | ✅              |
| `Ctrl + L`                  | Clear screen     | ✅              |

## Process Control

| Keybinding              | Action                           | Works in `tmux` |
| ----------------------- | -------------------------------- | --------------- |
| `Ctrl + C`              | Cancel/interrupt current command | ✅              |
| `Ctrl + Z`              | Suspend current process          | ✅              |
| `Ctrl + R`              | Search through command history   | ✅              |
| `Ctrl + G`              | Cancel search or command         | ✅              |
| `Ctrl + J` / `Ctrl + M` | Newline/Enter                    | ✅              |

## Miscellaneous

| Keybinding | Action                                     | Works in `tmux`     |
| ---------- | ------------------------------------------ | ------------------- |
| `Tab`      | Auto-complete                              | ✅                  |
| `Alt + .`  | Insert last argument from previous command | ✅ (may need `Esc`) |
| `!!`       | Repeat last command (typed as text)        | ✅                  |

## Notes for `tmux` Users

- `Ctrl + B` is the default **tmux prefix key**, so any terminal keybindings using `Ctrl + B` may conflict. You can:
  - Press it twice (`C-b C-b`) if you don't change the prefix.
  - Or remap the tmux prefix to something else (e.g. `Ctrl + A`).
- `Alt` (Meta) keybindings may require you to **press `Esc` first**, especially in some terminal emulators or over SSH.
- All keybindings that affect only **line editing in the shell** work the same inside a `tmux` pane, unless `tmux` intercepts the combination.

---

## Tip: How to Check What's Bound

In bash:

```bash
bind -P

```
