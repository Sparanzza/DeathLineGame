-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

widget = require ("widget")
widget.setTheme( "widget_theme_ios7" )
DEBUG = true

require ("utilsFx")
require("Player") --add player file
require("GameTrack") -- add game track file
require("Background") -- add background file
require("Foreground") --add foreground file
--require("TitleScreen") -- add Title Screen file
require("Utilities") -- add utilities file

gameFxGrp = display.newGroup( )
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
	background = newBackground()
	printd( "tamaño pantalla X " .. display.contentWidth )
	printd( "tamaño pantalla Y " .. display.contentHeight)
	printd("loading game ...")
	printd("creating level ...")
	level = newGameTrack(gameLength)
	printd("creating player ...")
	player = newPlayer() -- create new Player
	foreground = newForeground()
	printd("starting game ...")
	newGame() --start the game
	printd("end game ...")
end
function updateEngine( event )
	-- body
end

function newGame( )

	gameFxGrp:insert(player)
	gameFxGrp:insert(level)
	socre = 0 --reset score
	isActive = false --set active whether the game is false
	--player:updateLocation() --update player location
	player:reset() --reset player
	level:addLines() --add lines to the level
	level:start( ) --start the level
	foreground:updateUI()

end

--init the game
load()



