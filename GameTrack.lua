-- Code file for the game's level
local yDistance = 400

function newGameTrack(length)
	local self = display.newGroup()

	self.totalObjects = length
	self.object = {}
	self.lineData = {}

	function self:addData(x1,y1,x2,y2)
		local newLineData = lineData(x1,y1,x2,y2)
		for n=1,#newLineData do 
			local yArray = newLineData[n].y
			self.lineData[yArray] = newLineData[n].x
			--print("linedata" , newLineData[n].x)
		end

	end

	function self:addLines()
		local paint = {
		    type = "image",
		    filename = "sphereData.png"
		}
		self.object[1] = display.newCircle( display.contentWidth / 2, display.contentHeight /2, 48 )
		self.object[1].fill = paint
		self:insert(self.object[1])	

		for n=2,self.totalObjects do 

			local xLocation = math.random( 40, display.contentWidth - 40)
			local yLocation = n* (display.contentHeight / 2 - 50)

			local lastX = self.object[n-1].x
			local lastY = self.object[n-1].y	

			local newLine = display.newLine(lastX,lastY,xLocation,yLocation)
			newLine.strokeWidth = 4 -- stroke with 4 pixels
			newLine:setStrokeColor( 0.1, 1.0, 0.65, 1 )
			newLine:toBack( ) -- set to back lthe line
			self:insert(newLine)

			local groupDataBall = display.newGroup() --group to nest sphere and text coordinate
			groupDataBall.x = xLocation
			groupDataBall.y = yLocation
			local mySphere = display.newCircle( groupDataBall , 0,0,16, "right")
			local optionsTxt = 
						{
							parent = groupDataBall,
						    text = "X " .. xLocation .. " Y " .. yLocation,     
						    x = 55,
						    y = 0,
						    width = 256,
						    font = native.systemFont,   
						    fontSize = 24,
						    align = "right"  -- Alignment parameter
						}
			local coordText = display.newText( optionsTxt )
			coordText:setFillColor( 1, 0, 0.5 )
			mySphere.fill = paint

			self.object[n] = groupDataBall
			self:insert(self.object[n])

			self:addData(xLocation,yLocation,lastX,lastY)
			print( "xLocation ".. xLocation.." yLocation " .. yLocation.." lastX ".. lastX.." lastY " .. lastY)
		end
	end



	function self:updateLocation()
		self.currentCircle = -math.floor( self.y/ display.contentHeight / 2 - 50 )+1
		
		if -self.y > -yDistance and -self.y < self.levelLength - yDistance *4 then
			isActive = true
			local yLocation = round(-(self.y),0)+800
			if self.lineData[yLocation] then
				-- debugObject.x = self.lineData[yLocation]
				self.xScore = self.lineData[yLocation]

				-- levelDebugText.text = round(self.y,2) .. ", " .. yLocation .. ", " .. self.lineData[yLocation]
			end
		else
			isActive = false
		end
	end

	function self:start()
		self.levelLength = yDistance * self.totalObjects + display.contentHeight
		self.y = - self.levelLength + 800
		
		self.levelTime = 2000 + ( self.totalObjects*1000 )
		print(self.levelLength,self.levelTime)
		transition.to(self,{y = self.levelLength, delta = true,time = self.levelTime})
		levelDebugText = display.newText("",200,64)
	end

	function self:reset()
		self.lineData = {}
		for n=self.numChildren,1,-1 do 
			self[n]:removeSelf()
		end
	end

	-- debugObject = display.newCircle(0,800,12)
	-- debugObject:setFillColor( 1,0,0 )

	return self
end
