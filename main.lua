local physics = require("physics")
physics.start()

--grass
local grassProperty = {friction=0.5, bounce=0.3}
local grass  = display.newImage("grass.png")
grass.x = display.screenOriginX+480
grass.y = display.viewableContentHeight
physics.addBody(grass, "static", grassProperty)

--Car
local body = display.newRect(120, 100, 140, 140)
body:setFillColor(0,0,255)
physics.addBody(body, {friction=0.5, bounce=0.3})

local whell_1 = display.newImage("soccer_ball.png")
whell_1.x = 140; whell_1.y = 230;
physics.addBody(whell_1, {friction=0.7, bounce=0.0})
local whell_2 = display.newImage("soccer_ball.png")
whell_2.x = 240; whell_2.y = 230;
physics.addBody(whell_2, {friction=0.7, bounce=0.0})

local joint_1 = physics.newJoint("wheel", body, whell_1, 140, 230, 5, 5)
local joint_2 = physics.newJoint("wheel", body, whell_2, 240, 230, 5, 5)
joint_1.isLimitEnabled = true
joint_2.isLimitEnabled = true


--push button
local button = display.newImage("button.png")
button.x = display.viewableContentWidth*0.5
button.y = 50
function button:tap(event)
	body:applyForce(30, 0, body.x, body.y)
end

button:addEventListener("tap", button)