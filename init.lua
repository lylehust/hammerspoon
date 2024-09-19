-- Show Cog current playing song's singer/title/album in Menubar

if (hs.application.get("Cog") ~= nil) then
    local songTitle = hs.menubar.new(true, "cogsong")

    function songWatcher(appName, eventType, appObject)
        local ok, artist = hs.osascript.applescript('tell application "Cog" to artist of currentEntry')
        local ok, track = hs.osascript.applescript('tell application "Cog" to title of currentEntry')
        local ok, album = hs.osascript.applescript('tell application "Cog" to album of currentEntry')
        if (hs.screen.primaryScreen():name() == "LG HDR 4K") then -- Big external monitor
            songString = string.format("%s - %s - %s", artist, album, track)
        else -- Laptop monitor
            songString = string.format("%s - %s", artist, track)
        end
        songTitle:setTitle(songString)
    end
    songMenubar = hs.timer.doEvery(1, songWatcher)
--    songMenubar = hs.timer.new(1, songWatcher)
    songMenubar:start()
end

