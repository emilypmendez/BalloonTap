-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local background = display.newImageRect ( "background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY
-- loading the screen background and positioning --
local tapCount = 0
local tapText = display.newText( tapCount, display.contentCenterX, 20, native.system, 40)

-- event for displaying number of taps on the balloon --

local platform = display.newImageRect( "platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25
-- loading the platform --

local balloon = display.newImageRect ("balloon.png", 112, 112 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8
-- adjusting balloon locale on screen and balloon opacity -- 

local physics = require ("physics")
physics.start()

physics.addBody( platform, "static" )
physics.addBody( balloon, "dynamic", { radius=50, bounce=0.3 } )
-- load physics into the game,
-- enable the platform as static for other objects to remain static
-- then enable the balloon to become dynamic (can change bounce rate)

local function pushBalloon()
	balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
	tapCount = tapCount + 1
	tapText.text = tapCount
end
-- line 35 = allow the balloon to be pushed each time it is tapped
-- line 36 = increase the variable by 1 each time balloon is tapped
-- line 37 = updates text property of the 'tapText' object

balloon:addEventListener( "tap", pushBalloon )
-- trigger event = tapping balloon
