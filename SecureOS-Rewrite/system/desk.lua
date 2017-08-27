--Thanks NDFJay!
Background_dlc = 0
backgroundno = 3
slc = 0
function titleBar()
  term.setCursorPos(1,1)
  term.setBackgroundColor(tBarC)
  term.setTextColor(tBartC)
  term.clearLine()
  term.setCursorPos(2, 1)
  print("[Start]")
end
function drawDesktop()
  term.setBackgroundColor(1)
  term.clear()
local ok,val = pcall(runbackground)
if not ok then
--BFS.loadimages(lnes, errorlogo)
term.setCursorPos(1,1)
print("[Error]:",val,"\nResetting Background...")
sleep(.5)
backgroundno =  math.random(0, 1)
runbackground()
end
  titleBar()

end

function startM1()
term.setTextColor(tmenut)
term.setBackgroundColor(tmenu)
term.setCursorPos(1,2)
print("          ")
term.setCursorPos(1,3)
print("          ")
term.setCursorPos(1,4)
print("{Shutdown}")
term.setCursorPos(1,5)
print("{Restart} ")
term.setCursorPos(1,6)
print("Change Log")

end

drawDesktop()
while true do
local event, button, X, Y = os.pullEventRaw()
  if slc == 0 then
    if event == "mouse_click" then
      if X >=2 and X <=8 and Y==1 and button ==1 then
      startM1()
      slc = 1
        else
        drawDesktop()
      end
    end
   elseif slc == 1 then
if event == "mouse_click" then
     if X >=1 and X <=11 and button == 1 and Y== 4 then slc = 0 
       os.shutdown()
       elseif X>=1 and X<=11 and Y==5 and button ==1 then slc = 0
       os.reboot()
       else
       slc = 0
       drawDesktop()
     
     end 
  end
end
end
