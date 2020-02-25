dofile("wifi.lua")



print("Connecting to "..SSID)
wifi.setmode(wifi.STATION)
wifi.sta.config({ssid=SSID, pwd=PASSWORD})