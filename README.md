# ZMK Taipo Layout Firmware

This repo contains the [ZMK](https://zmkfirmware.dev/) firmware for the Taipo layout.
The official description of the layout can be found on the [Inclusive Keyboards Taipo Page](https://inkeys.wiki/en/keymaps/taipo).

## Supported Devices

- Ferris Sweep (aka cradio)
- Corne (untested)

## Usage

- Navigate to the [Github Actions](https://github.com/dlip/zmk-taipo/actions) tab and select the latest build
- In the artifacts section download firmware.zip
- Unzip firmware.zip
- Put your device into bootloader mode
- Copy the appropriate .uf2 file to your device

## Layout

This configuration has some modifications from the original layout:

- Inner and outer thumbs are flipped since i find space to be more natural on the outer thumb
- Uses extra keybindings which use both thumb keys together
- Fn layer key switched to 'insert'
- Adds Caps to '?'
- Adds alternate mappings for ''' and ';' since my ring and pinkie fingers don't get along

```
Input Output Inner Outer Both
#---  r      >     R     Print Screen
----

-#--  s      }     S     Brightness Up
----

--#-  n      ]     N     Brightness Down
----

---#  i      )     I     Play/Pause
----

----  a      <     A     Next Track
#---

----  o      {     O     Volume Up
-#--

----  t      [     T     Volume Down
--#-

----  e      (     E     Previous Track
---#

----  c      1     C     F1
-#-#

----  u      2     U     F2
-##-

----  q      3     Q     F3
#-#-

----  l      4     L     F4
##--

--##  y      5     Y     F5
----

-#-#  f      6     F     F6
----

-##-  p      7     P     F7
----

#-#-  z      8     Z     F8
----

##--  b      9     B     F9
----

----  h      0     H     F10
--##

----  d      @     D     F11
#--#

#--#  g      #     G     F12
----

#---  x      ^     X     Cut
--#-

---#  k      +     K     Copy
-#--

-#--  v      *     V     Paste
---#

--#-  j      =     J     Undo
#---

#---  m      M     $
---#

---#  w      W     &
#---

-#--  /      \     |
--#-

--#-  -      _     %
-#--

---#  ?      !     Caps
--#-

--#-  ,      .     ~
---#

#---  ;            :
-#--

--#-  ;            :
-#-#

-#--  '      `     "
#---

--##  '      `     "
-#--

-###  Tab    Ins   Del   BT Clear
----

----  Enter  AltGr Esc   Bootloader
-###

#---  Gui    PgUp  Right BT Profile 3
#---

-#--  Alt    Home  Up    BT Profile 2
-#--

--#-  Ctrl   End   Down  BT Profile 1
--#-

---#  Shift  PgDn  Left  BT Profile 0
---#
```

## Local Development

### Docker

#### Setup and build

```
scripts/docker-image.sh
scripts/docker-dev.sh
west init -l config
west update
west zephyr-export
west build -p -s zmk/app -b nice_nano_v2 -- -DSHIELD="cradio_left" -DZMK_CONFIG="$PWD/config"
```

The firmware file will be `build/zephyr/zmk.uf2`

#### Resume after quitting

```
  docker start -i zmk-taipo-dev
```

#### Clean up

```
  docker rm zmk-taipo-dev
```

