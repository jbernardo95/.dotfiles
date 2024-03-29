# macOS Configurations

## Preferences

Open *Preferences* and setup the following configurations:

### General

- Default web browser: Google Chrome

### Dock & Menu Bar

- General
  - Size: 25%
  - Magnification: No
  - Postion: Left
  - Automatically hide and show dock: Yes
  - Show recent application in Dock: No
  - Automatically hide and show the menu bar on desktop: Yes
- Sound 
    - Show in Menu Bar: No
- Now playing 
    - Show in Menu Bar: No
- Battery
    - Show percentage: Yes
- Clock
    - Show the day of the week: Yes
    - Use 24-hour clock: Yes
    - Display time with seconds: Yes
- Spotlight 
    - Show in Menu Bar: No
- Siri 
    - Show in Menu Bar: No

### Mission Control

Automatically rearrange Spaces based on most recent use: Off

### Security and Privacy

- Require password: immediately
- FileVault: On
- Firewall: On
- Automatically allow signed software to receive incoming connections: No

### Energy

- Battery
  - Turn display off after: 1 min
  - Enable Power Nap while on battery power: No
- Power Adapter
  - Turn display off after: 1 min
  - Prevent computer from sleeping automatically when the display is off: No

### Keyboard

- Key repeat and Delay Until Repeat: Maximum

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

### Mouse

- Scroll Direction Natural: No
- Tracking, Double Click and Scrolling speed two ticks before maximum

### Trackpad

- Secondary click: Click or tap with two fingers
- Tap to Click: Yes
- Scroll Direction Natural: No
- More gestures: all with three fingers, except swipe between pages with two

### Accessibility

- Zoom > Use scroll gesture with modifier keys to zoom: Yes / Command
- Display > Reduce motion: Yes

### Sound

- Play feedback when volume is changed: Yes

### Network

Set DNS servers to `1.1.1.1` and `1.0.0.1`.

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
