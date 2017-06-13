CanvasController = Object:extend()

function CanvasController:new()
    self.score = 0
    
    self.x = 4
    self.y = 4
    
    self.width = love.graphics.getWidth() - self.x * 2
    self.height = love.graphics.getHeight() - self.y * 2

end

function CanvasController:update(dt, player)
  
  self.score = player.score
  end

function CanvasController:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    
    love.graphics.print("Score: " .. self.score, self.x + 1, self.y + 1)
end