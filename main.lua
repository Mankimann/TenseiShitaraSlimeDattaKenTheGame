love.graphics.setDefaultFilter("nearest", "nearest")
local STI = require("sti")
local Player = require("Entity/player")
local LifeBar = require("gui/lifebar")


function love.load()
    Map = STI("map/1.lua", {"box2d"})
    World = love.physics.newWorld(0,0)
    World:setCallbacks(beginContact, endContact)
    Map:box2d_init(World)
    Map.layers.solid.visible = false
    Player:load()
    LifeBar:load()
end

function love.update(dt)
    World:update(dt)
    Player:update(dt)
   
end

function love.draw()
    love.graphics.setColor(1, 1, 0, 1)
    love.graphics.print("How to play it ?!", 200, 15, 0, 10)
    love.graphics.setBackgroundColor(0, 45, 245, 0)
    Map:draw(0, 0, 2, 2)
    love.graphics.push()
    love.graphics.scale(2,2)
    Player:draw()
    LifeBar:draw()
    love.graphics.pop()
    
end

function love.keypressed(key)
    Player:jump(key)
end

function beginContact(a, b, collision)
    Player:beginContact(a, b, collision)
end

function endContact(a, b, collision)
    Player:endContact(a, b, collision)
end

