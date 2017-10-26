-- Foreground.lua code
 widget = require( "widget" )

function newForeground()

	local self = display.newGroup() --group for foreground
	self.color = { 0.1, 1.0, 0.65, 1 }
	self.y = display.contentHeight  -- placeholder for the buttons
	self.x = display.contentWidth / 2 -- placeholder for the buttons
	self.image = display.newRect( self , 0, 0,
		display.contentWidth,display.contentHeight * .005)
	self.image:setFillColor( 0.1, 1.0, 0.65, 1 )
	self.image:toBack( )
	centerGradient( self.image )
	--bloomFx( self.image )

	local scoreTextParam = { --parameters score text
		text = "",
		x = 0, y = 60,
		font = native.systemFontBold,
		fontSize = 48
	}

	self.scoreText = display.newText( scoreTextParam )
	self.scoreText:setFillColor( 0.1, 1.0, 0.65, 1)
	self:insert( self.scoreText )

	function self:updateUI()
		self.scoreText.text = round( score , 0 )
	end

----[[
	local paintArrow = {
	    type = "image",
	    filename = "arrow.png"
	}

	-- left button
	self.leftButton = display.newGroup()
	self.leftButton:scale( 0.25, 0.25 )
	arrowImgLeft = display.newRect( self.leftButton ,0 ,0 ,512 ,512 )
	arrowImgLeft.fill = paintArrow
	arrowImgLeft:setFillColor(  0.1, 1.0, 0.65, 1 )
	self.leftButton.x = -240
	self.leftButton.rotation = 180
	self.leftButton.alpha = .2
	self.leftButton.id = "left_id"
	self.leftButton:addEventListener( "touch", self.leftButton )
	self.leftButton.touch = ButtonEvent


	--right Butoton
	self.rightButton = display.newGroup()
	self.rightButton:scale( 0.25, 0.25 )
	arrowImgRight = display.newRect( self.rightButton ,0 ,0 ,512 ,512 )
	arrowImgRight.fill = paintArrow
	arrowImgRight:setFillColor(  0.1, 1.0, 0.65, 1 )
	self.rightButton.x = 240
	self.rightButton.alpha = .2
	self.rightButton.id = "right_id"
	self.rightButton:addEventListener( "touch", self.rightButton )
	self.rightButton.touch = ButtonEvent

	-- Main group two buttons
	self.BtnGrp = display.newGroup()
	self.BtnGrp.y = -75 
	self:insert( self.BtnGrp )
	self.BtnGrp:insert( self.leftButton )
	self.BtnGrp:insert( self.rightButton )
	--]]


	return self
end

function ButtonEvent( self ,event )
    if event.phase == "began" then
    	display.getCurrentStage():setFocus( event.target )
    	leftIsHeld = true
    	if self.id == "left_id" then
    		-- left
    		print( "left" )
    	elseif self.id == "right_id" then
    		-- right
    		print("right")
    	end
    elseif event.phase == "ended" or event.phase == "cancelled" then
    	display.getCurrentStage():setFocus( nil )
    	leftIsHeld = false
    end
end



