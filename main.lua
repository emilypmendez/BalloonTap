-----------------------------------------------------------------------------------------
--
-- The main.lua file built from my pseudo instructions (in ze "code" journal at me house)
--
-----------------------------------------------------------------------------------------

-- 1 -- loading the screen background and positioning --
local background = display.newImageRect ( "background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY

-- 2 -- event for displaying number of taps on the balloon --
local tapCount = 0
local tapText = display.newText( tapCount, display.contentCenterX, 20, native.system, 40)

-- 3 -- loading the platform --

local platform = display.newImageRect( "platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25
-- 4 -- adjusting balloon locale on screen and balloon opacity --

local balloon = display.newImageRect ("balloon.png", 112, 112 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8

-- 5 -- load physics into game --
local physics = require ("physics")

-- 6 -- enable the platform as static for other objects to remain static
physics.start()

physics.addBody( platform, "static" )

-- 7 -- then enable the balloon to become dynamic (can change bounce rate)
physics.addBody( balloon, "dynamic", { radius=50, bounce=0.3 } )

-- 8 -- allow the balloon to be pushed each time it is tapped
-- addon functionality -- increase the variable by 1 each time balloon is tapped
-- addon functionality-- updates text property of the 'tapText' object
local function pushBalloon()
	balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
	tapCount = tapCount + 1
	tapText.text = tapCount
end

-- 9 -- trigger event = tapping balloon
balloon:addEventListener( "tap", pushBalloon )
