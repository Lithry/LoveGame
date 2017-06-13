PlayerController = Object:extend()

function PlayerController:new(speed)
    self.score = 0
    self.width = 50
    self.height = 50
    
    self.x = love.graphics.getWidth() / 2 - self.width / 2
    self.y = love.graphics.getHeight() - 10 - self.height
    
    self.speed = speed
    self.dead = false
end

function PlayerController:update(dt)
    local window_width = love.graphics.getWidth()
    local window_height = love.graphics.getHeight()
    
    if love.keyboard.isDown('w') and self.y > 10 and self.dead == false then
      self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown('s') and self.y < window_height - 10 - 50 and self.dead == false then
      self.y = self.y + self.speed * dt
    end
    
    if love.keyboard.isDown('a') and self.x > 10 and self.dead == false then
      self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown('d') and self.x < window_width - 10 - 50 and self.dead == false then
      self.x = self.x + self.speed * dt
    end
end

function PlayerController:checkCollision(obj)
  local self_left = self.x
  local self_right = self.x + self.width
  local self_top = self.y
  local self_bottom = self.y + self.height
  
  local obj_left = obj.x
  local obj_right = obj.x + obj.width
  local obj_top = obj.y
  local obj_bottom = obj.y + obj.height
  
  if  self_right > obj_left and
      self_left < obj_right and
      self_bottom > obj_top and
      self_top < obj_bottom then
      
        self.dead = true
        
    end
end

function PlayerController:AddScore()
  self.score = self.score + 1
end

function PlayerController:draw()
  if self.dead == false then
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  end
end