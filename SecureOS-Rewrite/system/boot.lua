BFS.udidv2("system/store/udid")
BFS.rwf("system/store/udid", "f")
BFS.setl(BFS.printline(2))
uname = BFS.printline(1)
shell.run("/system/images")
shell.run("/system/config.txt")
print("[Disclaimer]: This is a beta software!")
sleep(.5)
term.clear()
term.setCursorPos(1,1)

function bootfiles()
if fs.exists("/system/usr.src") then
BFS.rwf("/system/usr.src", "f")
filematch = BFS.decr(BFS.printline(2), uname)
name = BFS.decr(BFS.printline(1), uname)
else
if fs.exists("/system/setup.lua") then
shell.run("system/setup.lua")
else
BFS.df("url", "system/setup.lua")
end
end
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