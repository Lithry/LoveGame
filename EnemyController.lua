EnemyController = Object:extend()

function EnemyController:new(x, y, speed)
    self.x = x
    self.y = y
    self.speed = speed
end

function EnemyController:update(dt)
    
end

function EnemyController:draw()
    love.graphics.circle("fill", self.x, self.y, 50, 25)
end