# wlrix-sounds

The default system sound theme for wlRIX: the IRIX Indigo Magic desktop soundscheme, arranged as a
[freedesktop sound theme](https://specifications.freedesktop.org/sound-theme-spec/latest/) named `wlrix`.

**IRIX desktop sounds courtesy the SGI desktop.**

## Credits and terms

The sounds were created by **R.C. Underwood, Roger Powell and Jeff Essex** for the Indigo Magic Desktop in IRIX 5.3,
and survived largely intact through IRIX 6.5. R.C. Underwood specified and assembled the soundscheme; Jeff Essex
produced the pool of sounds it was selected from. `doc/sounds.html` is R.C. Underwood's own page about them (revised
1998, archived 2001), kept unmodified as the record of where they came from and what each one was for.

**This repository is not covered by wlRIX's MIT or GPL licenses.** The sounds were never released under a license. The
only terms anyone has are on that page: R.C. Underwood asks that anyone using them cite where they came from, with the
line *"IRIX desktop sounds courtesy the SGI desktop."* Keep that line and these credits with any copy of the sounds.

The files were taken from the *Indigo Reality Sounds* theme, the companion to the Indigo Reality icon theme. That
collection already had them as Ogg Vorbis files and had given most of them freedesktop names.

## What is here

```
sounds/wlrix/index.theme      the theme; Inherits=freedesktop
sounds/wlrix/stereo/*.ogg     25 sounds and 25 links
doc/sounds.html               the source record
```

Each IRIX sound is stored **once**, under the name wlRIX plays it by. Every other name for it is a relative symlink, the
same arrangement as wlrix-assets' icon and cursor themes, and `just install` keeps the links as links.

A name this theme does not have falls through to the stock `freedesktop` theme (`sound-theme-freedesktop`), and from
there to nothing. That is the spec's behavior, and it is why `Inherits` names it.

### Names

The sound naming spec covers most of what IRIX played sounds for. It has no names for the rest: launching, opening a
folder, moving an icon. Those use names with a `wlrix-` prefix. The spec's lookup drops a dash-separated suffix when a
name is missing, so `wlrix-open-remote-folder` would fall back to `wlrix-open-folder` in a theme that has only the one.

| IRIX sound                    | File                         | Also answers to                                                                |
|-------------------------------|------------------------------|--------------------------------------------------------------------------------|
| Beep                          | `bell`                       | `bell-window-system`, `bell-terminal`, `power-unplug-battery-low`              |
| Boot                          | `desktop-login`              | `system-ready`                                                                 |
| Boot4D                        | `system-bootup`              |                                                                                |
| Shutdown                      | `desktop-logout`             | `desktop-screen-lock`, `system-shutdown`                                       |
| Error                         | `dialog-error`               | `completion-fail`, `network-connectivity-error`                                |
| Fatal error                   | `dialog-error-serious`       | `suspend-error`                                                                |
| File arrival warning          | `dialog-warning`             | `message-new-email`, `message-new-instant`                                     |
| Question                      | `dialog-question`            |                                                                                |
| Information                   | `dialog-information`         |                                                                                |
| Completion                    | `completion-success`         | `complete-download`, `complete-media-burn`, `complete-media-rip`, `complete-scan` |
| Launch                        | `wlrix-launch`               |                                                                                |
| Open a folder                 | `wlrix-open-folder`          |                                                                                |
| Open a remote folder          | `wlrix-open-remote-folder`   | `network-connectivity-established`, `service-login`                            |
| Move an icon by drag-and-drop | `wlrix-drag-move`            | `drag-accept`                                                                  |
| Copy an icon by drag-and-drop | `wlrix-drag-copy`            | `complete-copy`                                                                |
| Ignore attempt to drop        | `drag-fail`                  |                                                                                |
| Shift an icon's position      | `wlrix-icon-shift`           |                                                                                |
| Put away an icon              | `wlrix-icon-put-away`        | `device-removed`, `service-logout`, `window-minimized`                         |
| Remove to the dumpster        | `file-trash`                 |                                                                                |
| Drag to trash                 | `wlrix-drag-to-trash`        |                                                                                |
| Remove permanently            | `item-deleted`               | `network-connectivity-lost`                                                    |
| Empty trash                   | `trash-empty`                |                                                                                |
| Mount a volume                | `wlrix-volume-mount`         | `window-unminimized`                                                           |
| Volume mount                  | `device-added`               |                                                                                |
| Switch desks                  | `desktop-switch-left`        | `desktop-switch-right`                                                         |

Most of the aliases are the ones Indigo Reality chose. Each was checked by decoding both files and comparing the
samples, so every name here plays an IRIX sound. Two differ from Indigo Reality:

- `file-trash` is *Remove to the dumpster*, the sound R.C. Underwood's page lists for it. Indigo Reality used the later
  *Drag to trash*, which is kept as `wlrix-drag-to-trash`.
- `device-added` is *Volume mount* rather than *Launch*, so a disk being plugged in does not sound like a program
  starting.

Four files from Indigo Reality are left out:

- `its-a-me.ogg` is not an IRIX sound.
- `Beep.wav` is a second copy of *Beep*.
- `window-new` and `window-close` were *Open a folder* and *Switch desks* under other names. IRIX had no window sounds,
  and with them every launch from the desktop would play *Launch* and then *Open a folder* on top of it. Without them
  the names find nothing here or in `freedesktop`, so windows open and close silently, as on IRIX. A theme that has
  window sounds plays them; the compositor asks for them either way.

## Installing

```sh
sudo just install    # or `just install-sounds` from wlrix-epoch
```

| Directory      | Installed to                 | Who reads it                                                        |
|----------------|------------------------------|---------------------------------------------------------------------|
| `sounds/wlrix` | `$PREFIX/share/sounds/wlrix/` | `wlrix-sound`, and libcanberra for GTK applications, by theme name. |

`just uninstall` removes it again.
