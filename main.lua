function love.load()
  Object = require "classic"
  require "PlayerController"
  require "EnemyController"
  require "CanvasController"
  require "StarsController"
  
  canvas = CanvasController()
  player = PlayerController(200)
  
  listOfEnemies = {}
  for nameCount = 1, 5 do
    local randomX = love.math.random( 10, love.graphics.getWidth() - 10 )
    local randomY = love.math.random( -10, -100 )
    local randomSpeed = love.math.random( 50, 100 )
    enemy = EnemyController(randomX, randomY, randomSpeed)
    table.insert(listOfEnemies, enemy)
  end
  
  listOfStars = {}
  for nameCount = 1, 100 do
    local randomX = love.math.random( 10, love.graphics.getWidth() - 10 )
    local randomY = love.math.random( -10, -100 )
    local randomSpeed = love.math.random( 50, 100 )
    stars = StarsController(randomX, randomY, randomSpeed)
    table.insert(listOfStars, stars)
  end
end

function love.update(dt)

  player:update(dt)
  canvas:update(dt, player, listOfEnemies)
  
  
  for i,e in ipairs(listOfEnemies) do
        e:update(dt, player)
        player:checkCollision(e)
    end
    
    for i,s in ipairs(listOfStars) do
        s:update(dt)
    end
end

function love.draw()
  canvas:draw()
  player:draw()
  
  for i,e in ipairs(listOfEnemies) do
        e:draw()
    end
    
    for i,s in ipairs(listOfStars) do
        s:draw()
    end
end