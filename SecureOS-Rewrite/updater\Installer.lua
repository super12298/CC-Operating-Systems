function df(url, path, wdl)
local check, msg = http.checkURL(url)
if not check then
write("Invalid URL: Error[" .. msg.."]")
else
if path == nul or path == "" or path == "/" then
write("Invalid Path")
else
	for i = 1, 3 do
	local response = http.get(url)
		if response then
		local data = response.readAll()
				if path then
				local f = io.open(path, "w")
				--print(url, wdl)
				sleep(.1)
				if wdl then
				f:write(wdl.."\n")
				end
				f:write(data)
				f:close()
				end
			return true
			end
		end
	return false
end
end
end
if not fs.exists("/api/BFS") then
df("https://raw.githubusercontent.com/super12298/CC-Operating-Systems/master/apis/BasicFunctions","/api/BFS")
end
os.loadAPI("api/BFS")
