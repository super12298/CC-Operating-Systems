--Thanks NDFJay!
Background_dlc = 0
backgroundno = 3
slc = 0
if tRGBback == nil then
tRGBback = 1
end
function titleBar()
  term.setCursorPos(1,1)
  term.setBackgroundColor(tBarC)
  term.setTextColor(tBartC)
  term.clearLine()
  BFS.tpla(2,1,"[Start]")
  BFS.tpla(49,1,"[@]")
end
function drawDesktop()
term.setBackgroundColor(tRGBback)
term.clear()
local ok,val = pcall(runbackground)
if not ok then
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
BFS.tpla(1,2," All Apps ")
BFS.tpla(1,3," Appstore ")
end

function startM2()
term.setTextColor(tmenut)
term.setBackgroundColor(tmenu)
BFS.tpla(42,2,"Change Log")
BFS.tpla(42,4,"{Shutdown}")
BFS.tpla(42,3,"{Restart} ")
end


drawDesktop()
while true do
local event, button, X, Y = os.pullEventRaw()
  if slc == 0 then
    if event == "mouse_click" then
      if X >=2 and X <=8 and Y==1 and button ==1 then
      startM1()
      slc = 1
      term.setBackgroundColor(tmenu)      
      BFS.tpla(2,1,"[Start]")      
      elseif X >=47 and X <=51 and Y==1 and button ==1 then
      startM2()
      slc = 2
		term.setBackgroundColor(tmenu)
		BFS.tpla(49,1,"[@]")
        else
        drawDesktop()
      end
    end
   elseif slc == 1 then
if event == "mouse_click" then
     if X >=1 and X <=11 and button == 1 and Y== 2 then slc = 0 
       --function
       elseif X>=1 and X<=11 and Y==3 and button ==1 then slc = 0
       --function
       else
       slc = 0
       drawDesktop()
     
     end 
  end

   elseif slc == 2 then
if event == "mouse_click" then
     if X >=44 and X <=51 and button == 1 and Y== 4 then slc = 0 
       os.shutdown()
       elseif X>=44 and X<=51 and Y==3 and button ==1 then slc = 0
       os.reboot()
       elseif X>=44 and X<=51 and Y==2 and button ==1 then slc = 0
		 term.setCursorPos(1,1)
		 term.setBackgroundColour(32768)
		 term.clear()
		 term.setBackgroundColour(128	)
       BFS.chlog("https://raw.githubusercontent.com/super12298/CC-Operating-Systems/master/SecureOS-Rewrite/Readme.txt","slow") 
	 	 sleep(2)
	 	 drawDesktop()
       else
       slc = 0
       drawDesktop()
     
     end 
  end

end
end
