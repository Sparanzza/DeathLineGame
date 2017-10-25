-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

widget = require ("widget")
widget.setTheme( "widget_theme_ios7" )
DEBUG = true

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

function printd(text)
	if DEBUG then
		print(text)
	end
end
function load() --starting function, load object
	printd("loading game ...")
	printd("creating player ...")
	player = newPlayer() -- create new Player
	printd("created player ...")
	printd("starting game ...")
	newGame() --start the game
	printd("end game ...")
end
function updateEngine( event )
	-- body
end

function newGame( )
	socre = 0 --reset score
	isActive = false --set active whether the game is false
	--player:updateLocation() --update player location
end

--init the game
load()



