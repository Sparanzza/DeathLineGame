--Background.lua

function newBackground()
	self = display.newImage( "Bacground.jpg" )
	self.x = display.contentWidth / 2
	self.y = display.contentHeight / 2

	return self
end