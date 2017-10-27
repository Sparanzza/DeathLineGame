-- TitleScreen.lua code

function newTitleScreen( )
	-- body
	local self = display.newGroup()
	self.x = display.contentWidth / 2
	self.y = display.contentHeight / 2

	self.image = display.newImage( "GameOver.png" )
	self:insert( self.image )
	function self:addUI(  ) --adds ui elements to title screen
		local options ={
			x = 0, y = 80,
			height = 120,
			id = "Restart",
			label = "Restart",
			size = 48,
			onRelease = restartButtonPress }

		self.restart = widget.newButton( options )
		self:insert( self.restart ) -- add restart butotn into restar button
		self.highScorelabel = display.newText( "High Score" , 0 , -30 , native.systemFont )
		self:insert(  self.highScorelabel )

	    self.highScore = display.newText(round(highScore,0),0,0,native.systemFontBold,24)
	    self:insert(self.highScore)
	end

	function self:removeScreen() -- remove title screen
		for n = self.numChildren, 1 , -1 do
			self[n]:removeSelf( )
		end
	end
	transition.to(self,{y = 420, time = 1500, transition=easing.outBounce, onComplete = self.addUI})
	return self
end

function restartButtonPress(event)
	titleScreen:removeScreen()
	newGame()
end