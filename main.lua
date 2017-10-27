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
require("TitleScreen") -- add Title Screen file
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
	levelDebugText = display.newText("",200,64)
	printd("starting game ...")
	newGame() --start the game
	printd("end game ...")
end

function update(e)
	if leftIsHeld then
		player:changeVelocity(-.65)
	end
	if rightIsHeld then
		player:changeVelocity(.65)
	end
	level:updateLocation()
	player:updateLocation()	
	if isActive then
		player:scoreDiference(level.xScore)
		if player.xDiff < 100 then 
			local newPoints = ((100-player.xDiff)*(100-player.xDiff))/10
			-- levelDebugText.text = newPoints ..  ", " .. player.xDiff
			score = score + newPoints
		end
		foreground:updateUI()
	end
end

function newGame( )
	--display.setDefault( "background", .1, .1, .1  )
	gameFxGrp:insert(player)
	gameFxGrp:insert(level)
	score = 0 --reset score
	isActive = false --set active whether the game is false
	--player:updateLocation() --update player location
	player:reset() --reset player
	level:addLines() --add lines to the level
	level:start( ) --start the level
	foreground:updateUI()
	timer.performWithDelay( 3000+gameLength*1000, endLevel )
	Runtime:addEventListener( "enterFrame", update )

end

function endLevel()
	if score > highScore then
		highScore = score
	end
	Runtime:removeEventListener( "enterFrame", update )
	player:reset()
	level:reset()
	foreground:updateUI()
	titleScreen = newTitleScreen()

end

--init the game
load()



