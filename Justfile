#!/usr/bin/env just --justfile
name := 'wlrix-sounds'

rootdir := ''
prefix := '/usr'

usrdir := absolute_path(clean(rootdir / prefix))
# A sound theme goes under `share/sounds/<theme>/`, because that is the only place one is looked
# for: `wlrix-sound`, libcanberra and anything else following the XDG sound theme spec walk
# XDG_DATA_DIRS/sounds and find a theme by *name*.
themename := 'wlrix'
themedir := usrdir / 'share' / 'sounds' / themename

# List available recipes.
default:
  @just --list

build:
  @echo "nothing to build: {{name}} is data"

# Install the sound theme.
#
# Deliberately does not build -- there is nothing to build -- but it is still run as root, and
# the other components' justfiles all say this in the same place:
#
#     sudo just install
[doc("Install the sound theme (run as root)")]
install:
  #!/usr/bin/env bash
  set -euo pipefail
  # index.theme is what makes this a theme rather than a directory of files. Without it every
  # lookup skips the whole tree and quietly falls back to the freedesktop theme.
  install -Dm0644 sounds/{{themename}}/index.theme '{{themedir}}'/index.theme
  # Entry by entry and **links kept as links**, the way wlrix-assets installs its icon and
  # cursor themes: 25 of the 50 names are a freedesktop name for one of the 25 IRIX sounds, and
  # `install` dereferences, so a recursive copy would write the same sound out once per alias.
  for d in sounds/{{themename}}/*/; do
      sub="$(basename "$d")"
      install -d '{{themedir}}'/"$sub"
      for f in "$d"*; do
          [ -e "$f" ] || continue
          name="$(basename "$f")"
          if [ -L "$f" ]; then
              # Relative targets, all within this one directory, so the link is correct
              # wherever the theme lands -- including a staged install under DESTDIR.
              ln -sfn "$(readlink "$f")" '{{themedir}}'/"$sub/$name"
          else
              install -Dm0644 "$f" '{{themedir}}'/"$sub/$name"
          fi
      done
  done
  echo "installed {{themedir}} ({{themename}} sound theme)"

# Remove what `install` put down.
[doc("Remove what install put down")]
uninstall:
  #!/usr/bin/env bash
  set -euo pipefail
  # Our own theme directory only. `share/sounds` belongs to the distribution and holds every
  # other theme on the machine.
  rm -rf '{{themedir}}'
  echo "removed {{themedir}}"

clean:
  @echo "nothing to clean: {{name}} is data"
