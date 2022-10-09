# Auto Download from Olympus Tough TG-6

This is a set of scripts that automatically download all pictures from the
Olympus Tough TG-6 camera over the WIFI connection.

## Setup

This leads you through the setup steps.

### auto connect to wifi

Setup wpa_supplicant.

Edit `/etc/wpa_supplicant/wpa_supplicant.conf`.

```
country=GB
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
# use the ssid from the camera here:
  ssid="TG-6-P-BJ6C37998"
  scan_ssid=1
# use the password from the camera here:
  psk="03850123"
  key_mgmt=WPA-PSK
}
```	

See also:
- https://linuxhint.com/how-to-use-wpa-supplicant/

### Clone this repository

```
git clone https://github.com/ammanVMS/olympus-tough-auto-download
```

### configure the scripts

Edit `download.sh`, the configuration section to adjust these variables:

- Make sure that the directory mentioned in `DIRECTORY` exists.
  That is where the files go.
- `IP` is the IP address of your camera.
- `BASE_URL` is the url of the folder that has the pictutes.

```
# configuration
DIRECTORY="/data/share/Tough-Camera"
IP=192.168.0.10
BASE_URL="http://$IP/DCIM/100OLYMP"
```

### add to crontab


`crontab -e` 

Add the path to the cron.sh file:

```
/home/pi/olympus-tough-auto-download/cron.sh
```

### End of setup

Now, it should work:

1. Turn on the camera
2. Press the WIFI button for log
3. You see a QR-CODE
4. You see "Connecting your smartphone"

Now, your pictures get copied.

