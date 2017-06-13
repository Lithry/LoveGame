EnemyController = Object:extend()

function EnemyController:new(x, y, speed)
    self.x = x
    self.y = y
    self.width = 50
    self.height = 50
    self.speed = speed
end

function EnemyController:update(dt, canvas)
    local window_height = love.graphics.getHeight()
    
    self.y = self.y + self.speed * dt
    
    if self.y > window_height then
      local randomY = love.math.random( 10, 400 )
      self.y = -randomY
      local randomX = love.math.random( 10, love.graphics.getWidth() - 10 )
      self.x = randomX
      canvas.score = canvas.score + 1
    end
end

function EnemyController:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end