EnemyController = Object:extend()

function EnemyController:new(x, y, speed)
    self.x = x
    self.y = y
    
    self.image = love.graphics.newImage("Sprites/Meteor.png")
    
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    
    self.rotation = love.math.random( 0, 360)
      
    self.speed = speed
end

function EnemyController:update(dt, player)
    local window_height = love.graphics.getHeight()
    
    self.y = self.y + self.speed * dt
    
    if self.y > window_height then
      local randomY = love.math.random( 10, 400 )
      self.y = -randomY
      local randomX = love.math.random( 10, love.graphics.getWidth() - (10 + self.width) )
      self.x = randomX
      player:AddScore()
    end
end

function EnemyController:Restart()
  local randomY = love.math.random( 10, 400 )
  self.y = -randomY
  local randomX = love.math.random( 10, love.graphics.getWidth() - (10 + self.width) )
  self.x = randomX
end
    
function EnemyController:draw()
    love.graphics.draw(self.image, self.x, self.y, math.rad(self.rotation), 1, 1, self.width / 2, self.height / 2)
    
  --local self_left = self.x - self.width / 2
  --local self_right = self.x + self.width / 2
  --local self_top = self.y - self.height / 2
  --local self_bottom = self.y + self.height / 2
  --love.graphics.rectangle('line',self_left, self_top,self.width, self.height)
end