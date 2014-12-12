-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

--------------------------------------------

-- forward declarations and other locals
local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5

local function myTapListener( event )

    -- code executed when the button is tapped
    if (event.y < display.contentHeight/3) then
    	if (event.x < display.contentWidth/3) then
    		print( " 1 " )
		elseif (event.x > 2*display.contentWidth/3) then
			print( " 3 " )
		else
			print( " 2 " )
		end
	elseif (event.y > 2*display.contentHeight/3) then
		if (event.x < display.contentWidth/3) then
    		print( " 7 " )
		elseif (event.x > 2*display.contentWidth/3) then
			print( " 9 " )
		else
			print( " 8 " )
		end
	else
		if (event.x < display.contentWidth/3) then
    		print( " 4 " )
		elseif (event.x > 2*display.contentWidth/3) then
			print( " 6 " )
		else
			print( " 5 " )
		end
	end
		
end

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

	-- create a grey rectangle as the backdrop
	local background = display.newRect( 0, 0, screenW, screenH )
	background.anchorX = 0
	background.anchorY = 0
	background:setFillColor( .5 )
	
	-- adding vertical line
	lineX = display.contentWidth/3
	lineY = 0
	local vLine1 = display.newLine( lineX, lineY, lineX, lineY + display.contentHeight )
	vLine1.strokeWidth = 15
	vLine1 = display.newLine( lineX*2,lineY, lineX*2, lineY + display.contentHeight )
	vLine1.strokeWidth = 15
	-- adding horizontal lines
	lineX = 0
	lineY = display.contentHeight/3
	vLine1 = display.newLine( lineX, lineY, lineX + display.contentWidth , lineY )
	vLine1.strokeWidth = 15
	vLine1 = display.newLine( lineX,lineY*2, lineX + display.contentWidth, lineY*2 )
	vLine1.strokeWidth = 15

	-- adding event listener to the background
	background:addEventListener( "tap", myTapListener )

	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( vLine1 )

end



function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		-- Called when the scene is now off screen
	end
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	
end
---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene