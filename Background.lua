--Background.lua

function newBackground()
	self = display.newImage( "Bacground.jpg" )
	self.alpha = 0.2  --change the alpha property
	self.x = display.contentWidth / 2
	self.y = display.contentHeight / 2
	self:toBack( )
	return self
end