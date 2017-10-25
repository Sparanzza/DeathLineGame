-- Utilities.lua code

-- Bresenham's line algorithm
function lineData(x0, y0, x1, y1)
	local lineArray = {}
	local step = false
	if math.abs(y1 - y0) > math.abs(x1 - x0) then step = true end
	if step then
	        x0, y0 = swap(x0, y0)
	        x1, y1 = swap(x1, y1)
	end            
	 
	if x0 > x1 then
	        x0, x1 = swap(x0, x1)
	        y0, y1 = swap(y0, y1)
	end
	local deltax = x1 - x0
	local deltay = math.abs(y1 - y0)
	local err = deltax / 2
	local ystep = 0
	local y = y0
	if y0 < y1 then ystep = 1 else ystep = -1 end
	for x=x0,x1 do
	        lineArray[#lineArray+1] = {}
	if step then
	        lineArray[#lineArray].y = x
	        lineArray[#lineArray].x = y
	 else
	        lineArray[#lineArray].x = x  
	        lineArray[#lineArray].y = y          
	 end            
	 err = err - deltay
	         if err < 0 then
	                 y = y + ystep
	                 err = err + deltax
	        end
	end
	return lineArray
end