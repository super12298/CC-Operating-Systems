BFS.udidv2("system/store/udid")
BFS.rwf("system/store/udid", "f")
BFS.setl(BFS.printline(2))
shell.run("/system/images")
shell.run("/system/config.txt")
print("[Disclaimer]: This is a beta software!")
sleep(.5)
term.clear()
term.setCursorPos(1,1)

function bootfiles()
if dvmd == 1 then
else
BFS.loadimages(totallnes, bootlogo, Dos)
end
end

function setupandlogin()
term.clear()
z = 1
BFS.loadimages(lnes, loginlogo, Dos)
term.setCursorPos(15,14)
print(name)
BFS.dply(1,1)
if dvmd == 1 then
BFS.tpla(1,2,"[Project Secure] Sys: ")
term.setCursorPos(35,1)
print("Space;",fs.getFreeSpace("/"))
print("["..totallnes.." Dev ")
else
BFS.tpla(1,2,"[Project Secure] Ver: ")
end
BFS.readfile(23,2,"system/version.txt")
term.setCursorPos(15,16)
input = read("*")
	if input == filematch then
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