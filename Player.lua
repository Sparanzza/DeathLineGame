--Code for player
local maxSpeed = 25

function newPlayer()
	--[[
	local self = display.newImage( "player.png", 
									display.contentWidth / 2,
									display.contentHeight )
									]]
	local self = display.newGroup()
	-- set texture player
	local compositePaint = {
			    type="composite",
			    paint1={ type="image", filename="glowPlayer.png" },
			    paint2={ type="image", filename="player.png" }
			}
	local barTexture = display.newRect( 0, 0, 512, 170 )
	barTexture.fill = compositePaint -- Apply the composite paint as the object's fill
	barTexture.fill.effect = "composite.add" 	-- Set a composite blend as the fill effect

	self:insert(barTexture)
	self.x = display.contentWidth / 2
	self.y = display.contentHeight 
	self:scale( .35, .35 )
	self.velocity = 0

	function self:updateLocation() --run per frame, update location player
		self.x = self.x + self.velocity --add velocity
		if self.x > display.contentWidth then --is beyend the screen
			self.x = 0
		elseif self.x < 0 then
			self.x = display.contentWidth
		end
	end

	function self:scoreDiference(xScore) -- check the distance the center of the line
		if xScore then -- if score exist 
			self.xDiff = math.abs( self.x - xScore )
		end
	end

	function self:changeVelocity( speedChange )
		self.velocity = clamp( self.velocity +  speedChange , -maxSpeed , maxSpeed)
	end

	function self:reset() --reset the player
		self.x = display.contentWidth / 2 --reset position in the middle of the screen
		self.velocity = 0 --reset velocity
	end

	return self
end
