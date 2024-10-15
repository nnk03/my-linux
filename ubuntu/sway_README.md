# Needed packages for ubuntu

1. brightnessctl, pavucontrol ?

1. brightnessctl might not work without root privileges, so run the below command

```
sudo chmod u+s $(which brightnessctl)
```

1. need the packages `grim` and `slurp` to take screenshots

```
sudo apt install grim slurp
```

1. Using sway might cause matplotlib not to show figures

So, install `pyqt5` package
and add the below lines to files which use plot to show

```
import matplotlib
matplotlib.use('Qt5Agg')  # Use the Qt5 backend for compatibility with Wayland
```

or the below solution might work\
Problem with matplotlib plot rendering in sway window manager

Try these

```
sudo apt install qtwayland5
```

if the file to be run is `test.py`\
Run it with

```
QT_QPA_PLATFORM=xcb python3 test.py
```

1. For using matlab in sway window manager
   [Reddit Discussion](https://www.reddit.com/r/matlab/comments/1dhejp5/matlab_gui_not_loading_properly_on_arch/)

```
sudo apt install wmname
```

or

```
sudo apt install suckless-tools
```

Run `wmname compiz` before launching matlab

1. For notifying user of low battery alert, install `mako`

then add these to systemd services?

`/etc/systemd/system/low_battery.service`

```
[Unit]
Description=Low Battery Notification Script

[Service]
ExecStart=/home/neeraj/.config/waybar/low_battery.sh
Environment="DISPLAY=:0"
Environment="DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus"
User=neeraj
```

`/etc/systemd/system/low_battery.timer`

```
[Unit]
Description=Run Low Battery Script Every 2 Minutes

[Timer]
OnBootSec=2min
OnUnitActiveSec=2min
AccuracySec=1ms

[Install]
WantedBy=timers.target
```

Then Run the below

```sh
sudo systemctl daemon-reload
sudo systemctl restart low_battery.service
sudo systemctl restart low_battery.timer

```

Run the below to check status

```sh
systemctl status low_battery.service

```

To check logs, run the below

```sh
journalctl -u low_battery.service

```

# Needed packages for arch

1. install pavucontrol, brightnessctl, gnome-keyring

1. Charging and plugged-in icon not refreshing automatically

1. refer this website [https://wiki.archlinux.org/title/GNOME/Keyring](https://wiki.archlinux.org/title/GNOME/Keyring)
