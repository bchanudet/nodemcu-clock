# nodemcu-clock
NodeMCU project for a homemade 7-segment digital clock, synced with NTP

## Firmware 

The NodeMCU firmware was built against the master branch and includes the following modules: gpio, net, node, rtctime, sntp, tmr, wifi.

### Flashing the firmware

    esptool.py --port /dev/ttyUSB0 write_flash -fm dio 0x00000 ./nodemcu/firmware.bin

### Uploading the code

#### Create a file `wifi.lua` in `./nodemcu` with following contents

```lua
SSID="PutYourSSIDHere"
PASSWORD="PutYourPasswordHere"
```

#### Upload everything to NodeMCU.

    cd nodemcu && nodemcu-uploader upload *.lua