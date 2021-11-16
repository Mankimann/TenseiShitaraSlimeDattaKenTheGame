local LifeBar = {}

function LifeBar:load()
self.texture = "/assets/LifeBar.png"
self.lifebar_texture = love.graphics.newImage(self.texture)
self.w = 75
self.h = 18
end

function LifeBar:draw()
love.graphics.draw(self.lifebar_texture, 230, 60, 0, 3, 3, self.w, self.h)
end  

return LifeBar   