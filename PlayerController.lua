PlayerController = Object:extend()

function PlayerController:new(x, y, speed)
    self.x = x
    self.y = y
    self.speed = speed
end

function PlayerController:update(dt)
    if love.keyboard.isDown('w') and self.y > 100 then
      self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown('s') and self.y < 500 then
      self.y = self.y + self.speed * dt
    end
    
    if love.keyboard.isDown('a') and self.x > 100 then
      self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown('d') and self.x < 700 then
      self.x = self.x + self.speed * dt
    end
end

function PlayerController:draw()
    love.graphics.circle("fill", self.x, self.y, 50, 25)
end