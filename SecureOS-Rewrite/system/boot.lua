
shell.run("/system/images")
shell.run("/system/config.txt")
print("[Disclaimer]: This is a beta software!")
sleep(.5)
term.clear()
term.setCursorPos(1,1)
lnes = 19
totallnes = lnes*8

function bootfiles()
BFS.loadimages(totallnes, bootlogo)
end

function setupandlogin()
term.clear()
z = 1
BFS.loadimages(lnes, loginlogo)
term.setCursorPos(15,14)
print(readusern)
BFS.dply(1,1)
BFS.tpla(1,2,"[Project Secure] Version:")
BFS.readfile(26,2,"system/version.txt")
if debug == "1" then
write(" [DEV EDITION]  ")
end
term.setCursorPos(15,16)
usrpwd = read("*")
	if usrpwd == readuserpwd then
	if not fs.exists( "temp" ) then
	File = fs.open("temp", "w")
	File.write(" ")
	File.close()
	end
	shell.run("/system/desk.lua")
	else
	setupandlogin()
	end
end

local ok,val = pcall(bootfiles)
if not ok then
BFS.loadimages(lnes, errorlogo)
  term.setCursorPos(1,1)
  print("[Error]:",val)
  sleep(10)
    os.reboot()
end
local ok,val = pcall(setupandlogin)
if not ok then
BFS.loadimages(lnes, errorlogo)
term.setCursorPos(1,1)
  print("[Error]:",val)
  sleep(10)
  os.reboot()
end