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

function runbackground()
if Background_dlc == nil or Background_dlc == 0 and backgroundno >= 5 then
backgroundno = 4
end
if backgroundno == nil then
backgroundno = 0
end
term.setCursorPos(1,2)
if backgroundno == 0 then
term.setBackgroundColor( colors.blue )
term.clear()
end
if backgroundno == 1 then
term.setBackgroundColor( colors.red )
term.clear()
end
if backgroundno == 2 then
BFS.loadimages(lnes, classicbg)
end
if backgroundno == 3 then
BFS.loadimages(lnes, bootlogo)
end
if backgroundno == 4 then
BFS.loadimages(lnes, errorlogo)
end
if backgroundno == 99 then
BFS.breakbg(classicbg, 19, 19)
end
if backgroundno == 100 and Background_dlc >= 1 then
BFS.merge(errorlogo, 19, 10, 1)
BFS.merge(bootlogo, 19, 19, 11)
end
if backgroundno == 101 and Background_dlc >= 1 then
BFS.merge(bootlogo, 19, 10, 1)
BFS.merge(errorlogo, 19, 19, 11)
end
end

function bootfiles()
if fs.exists("/system/usr.src") then
BFS.rwf("/system/usr.src", "f")
filematch = BFS.decr(BFS.printline(2), uname)
name = BFS.decr(BFS.printline(1), uname)
else
if fs.exists("/system/setup.lua") then
shell.run("system/setup.lua")
else
BFS.df("https://raw.githubusercontent.com/super12298/CC-Operating-Systems/master/SecureOS-Rewrite/system/setup.lua", "system/setup.lua")
os.reboot()
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

if not term.isColor() then
lnes = 0
end

local ok,val = pcall(bootfiles)
if not ok then
BFS.loadimages(lnes, errorlogo)
term.setCursorPos(1,1)
if string.match(val, "supported") then
print("[Error]:","This computer is not yet supported.\nSorry for the inconvenience. (T_T)\n")
else
  print("[Error]:",val)
end
sleep(9999999)
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
