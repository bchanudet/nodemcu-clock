dofile("wifi.lua")

CURRENT_ADDRESS = 1
CURRENT_DIGITS = {"_","_","_","_"}

-- for led   H  H : M  M
ADDRESSES = {0, 1,  2, 3}

-- Adresses for segments
SEGMENTS = {0, 0, 0, 0, 0, 0, 0}

-- Configuration of segments to display numbers and letters
LETTERS = {}
LETTERS["_"] = {0, 0, 0, 1, 0, 0, 0}
LETTERS["0"] = {1, 1, 1, 1, 1, 1, 0} 
LETTERS["1"] = {0, 1, 1, 0, 0, 0, 0} 
LETTERS["2"] = {1, 1, 0, 1, 1, 0, 1} 
LETTERS["3"] = {1, 1, 1, 1, 0, 0, 1} 
LETTERS["4"] = {0, 1, 1, 0, 0, 1, 1} 
LETTERS["5"] = {1, 0, 1, 1, 0, 1, 1} 
LETTERS["6"] = {1, 0, 1, 1, 1, 1, 1}
LETTERS["7"] = {1, 1, 1, 0, 0, 0, 0} 
LETTERS["8"] = {1, 1, 1, 1, 1, 1, 1} 
LETTERS["9"] = {1, 1, 1, 1, 0, 1, 1} 
LETTERS["A"] = {1, 1, 1, 0, 1, 1, 1} 
LETTERS["B"] = {0, 0, 1, 1, 1, 1, 1} 
LETTERS["C"] = {0, 0, 0, 1, 1, 0, 1}
LETTERS["D"] = {0, 1, 1, 1, 1, 0, 1}
LETTERS["E"] = {1, 0, 0, 1, 1, 1, 1}
LETTERS["F"] = {1, 0, 0, 0, 1, 1, 1} 


function gotip()
    print("Done! ".. wifi.sta.getip())
end

function telltime()
    tm = rtctime.epoch2cal(rtctime.get())
    print(string.format("%04d/%02d/%02d %02d:%02d:%02d", tm["year"], tm["mon"], tm["day"], tm["hour"], tm["min"], tm["sec"]))
end

function displaychar()

end

print("Connecting to "..SSID)
wifi.setmode(wifi.STATION)
wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, gotip)
wifi.sta.config({ssid=SSID, pwd=PASSWORD})

sntp.sync(nil, nil, nil, 1)

tmr.create():alarm(10000, tmr.ALARM_AUTO, telltime)
tmr.create():alarm(2, tmr.ALARM_AUTO, displaychar)