# macOS Configurations

## Preferences

Open *Preferences* and setup the following configurations:

### Network

- Firewall: yes
- Automatically allow downloaded signed software to receive incoming connections: No
- Enable stealth mode: Yes

Set DNS servers to `1.1.1.1` and `1.0.0.1`.

### Accessibility

- Zoom > Use scroll gesture with modifier keys to zoom: Yes / Command
- Display > Reduce motion: Yes

### Control Centre

#### Control Centre Modules

- Wi-if: Show in Menu Bar
- Bluetooth: Show in Menu Bar
- AirDrop: Don't show in Menu Bar
- Focus: Show When Active
- Stage Manager: Don't show in Menu Bar
- Screen Mirroring: Show When Active
- Display: Don't show in Menu Bar
- Sound: Don't show in Menu Bar
- Now Playing: Don't show in Menu Bar

#### Other Modules

- Battery:
    - Show in Menu Bar: Yes
    - Show Percentage: Yes

#### Menu Bar Only

- Clock:
    - Show the day of the week: Yes
    - Display the time in seconds: Yes
- Spotlight: Don't Show in Menu Bar
- Siri: Don't Show in Menu Bar
- Automatically hide and show the menu bar: Always

### Desktop and Dock

#### Dock

- Size: 25%
- Magnification: Off
- Postion: Left
- Automatically hide and show dock: Yes
- Show suggested and recent application in Dock: No

#### Widgets

- Default web browser: Google Chrome

#### Mission Control

- Automatically rearrange Spaces based on most recent use: Off

### Notifications

- Allow notifications when the screen is locked: No

### Sound

- Play feedback when volume is changed: Yes

### Lock Screen

- Turn display off on battery when inactive: For 1 min
- Turn display off on power adapter when inactive: For 1 min
- Require password after screen saver begins or display is turned off: Immediately

### Privacy & Security

- FileVault: On

### Keyboard

- Key repeat rate: Maximum
- Delay until repeat: Maximum

```
https://github.com/tmux/tmux/issues/353#issuecomment-419286706
https://apple.stackexchange.com/questions/10467/how-to-increase-keyboard-key-repeat-rate-on-os-x

# Key Repeat
# Normal minimum is 2 (30 ms)
$ defaults write -g KeyRepeat -int 1

# Delay Until Repeat
# Normal minimum is 15 (225 ms)
$ defaults write -g InitialKeyRepeat -int 10
```

#### Shortcuts

Mission Control

- `Ctrl + Right Arrow` and `Ctrl + Left Arrow` - move between Mission Control Spaces 
- `Ctrl + Up Arrow` - Mission Control
- `Ctrl + Down Arrow` - Application Windows

Keyboard 

- `Cmd + §` - Move focus next window

Spotlight

- `Alt + Space` - Show Spotlight search 

### Trackpad

- Secondary click: Click or tap with two fingers
- Tap to Click: Yes
- Natural scrolling: No
- More gestures: all with three fingers, except swipe between pages with two

## Finder

### General

New Finder windows show: Desktop

### Sidebar

- User Folder
- Airdrop
- Dropbox
- Desktop
- Downloads
- Applications
- documents
- src
- tmp

### Advanced

- Show all filename extensions: On

### View Options

Go to Desktop > Secondary Mouse Click > Show View Options

- Icon Size: 40x40
- Grid Spacing: 3/8
- Label Position: Right
