StarsController = Object:extend()

function StarsController:new(x, y, speed)
    self.x = x
    self.y = y
    
    self.image = love.graphics.newImage("Sprites/Star.png")
    
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
      
    self.speed = speed
    self.window_height = love.graphics.getHeight()
end

function StarsController:update(dt, player)
    
    
    self.y = self.y + self.speed * dt
    
    if self.y > self.window_height then
      local randomY = love.math.random( 10, 400 )
      self.y = -randomY
      local randomX = love.math.random( 10, love.graphics.getWidth() - (10 + self.width) )
      self.x = randomX
    end
end
    
function StarsController:draw()
    love.graphics.draw(self.image, self.x, self.y, math.rad(self.rotation), 1, 1, self.width / 2, self.height / 2)
end