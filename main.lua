-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

widget = require ("widget")
widget.setTheme( "widget_theme_ios7" )

require("Player") --add player file
--require("GameTrack") -- add game track file
--require("Background") -- add background file
--require("Foreground") --add foreground file
--require("TitleScreen") -- add Title Screen file
--require("Utilities") -- add utilities file

gameLength = 20 --seconds
score = 0 --actual score for the player
highScore = 0 --set initial high score 
isActive = false 

function load() --starting function, load object
	print("loading game ...")
end


