#!/bin/sh

# KDE Configs

# Keyboard Shortcuts
kwriteconfig --file ~/.config/kglobalshortcutsrc --group "kwin" --key "Window Maximize" "Meta+Up,none,Maximize Window"
kwriteconfig --file ~/.config/kglobalshortcutsrc --group "kwin" --key "Window Quick Tile Left" "Meta+Left,none,Quick Tile Window to the Left"
kwriteconfig --file ~/.config/kglobalshortcutsrc --group "kwin" --key "Window Quick Tile Right" "Meta+Right,none,Quick Tile Window to the Right"
kwriteconfig --file ~/.config/kglobalshortcutsrc --group "kwin" --key "Expose" "Meta+Tab,Ctrl+F9,Toggle Present Windows (Current desktop)"

# Theme
kwriteconfig --file ~/.config/plasmarc --group "Theme" --key "name" "breeze-dark"

# Energy Saving
kwriteconfig --file ~/.config/powermanagementprofilesrc --group "AC/DimDisplay" --key "idleTime" "300000"
kwriteconfig --file ~/.config/powermanagementprofilesrc --group "AC/HandleButtonEvents" --key "powerButtonAction" "1"
kwriteconfig --file ~/.config/powermanagementprofilesrc --group "AC/SuspendSession" --key "idleTime" "7200000"
kwriteconfig --file ~/.config/powermanagementprofilesrc --group "AC/SuspendSession" --key "suspendType" "1"
