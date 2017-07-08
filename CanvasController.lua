CanvasController = Object:extend()

function CanvasController:new()
    self.score = 0
    
    self.x = 4
    self.y = 4
    
    self.width = love.graphics.getWidth() - self.x * 2
    self.height = love.graphics.getHeight() - self.y * 2
    
    self.PlayerDead = false
end

function CanvasController:update(dt, player, listOfEnemies)
  self.score = player.score
  self.PlayerDead = player.dead
  
  if self.PlayerDead == true then
      if love.keyboard.isDown('r') then
        player:Restart()
        for i,e in ipairs(listOfEnemies) do
          e:Restart()
        end
      elseif love.keyboard.isDown('q') then
        love.event.quit()
      end
  end
end

function CanvasController:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    
    love.graphics.print("Score: " .. self.score, self.x + 1, self.y + 1, 0, 1, 1)
    
    if self.PlayerDead == true then
      love.graphics.print("Dead", self.width / 2, self.height / 2, 0, 1, 1)
      love.graphics.print("Pres R to Restart", self.width / 2 - 30, self.height / 2 + 25, 0, 1, 1)
      love.graphics.print("Pres Q to Quit", self.width / 2 - 20, self.height / 2 + 50, 0, 1, 1)
    end
end