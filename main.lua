function love.load()
  Object = require "classic"
  require "PlayerController"
  require "EnemyController"
  require "CanvasController"
  
  canvas = CanvasController()
  player = PlayerController(200)
  
  listOfEnemies = {}
  for nameCount = 1, 5 do
    local randomX = love.math.random( 10, love.graphics.getWidth() - 10 )
    local randomY = love.math.random( -10, -100 )
    local randomSpeed = love.math.random( 200, 500 )
    enemy = EnemyController(randomX, randomY, randomSpeed)
    table.insert(listOfEnemies, enemy)
    
  end
  
end

function love.update(dt)
  canvas:update(dt, player)
  player:update(dt)
  
  for i,e in ipairs(listOfEnemies) do
        e:update(dt, player)
        player:checkCollision(e)
    end
end

function love.draw()
  canvas:draw()
  player:draw()
  
  
  for i,e in ipairs(listOfEnemies) do
        e:draw()
    end
end