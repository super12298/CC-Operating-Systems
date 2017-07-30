Background_dlc = 0
backgroundno = 3
local ok,val = pcall(runbackground)
if not ok then
--BFS.loadimages(lnes, errorlogo)
term.setCursorPos(1,1)
print("[Error]:",val,"\nResetting Background...")
sleep(.5)
backgroundno =  math.random(0, 1)
runbackground()
end