function love.load()
  Object = require "classic"
  require "PlayerController"
  require "EnemyController"
  require "CanvasController"
  
  onGame = false
  image = love.graphics.newImage("Sprites/Space.jpg")
  width = image:getWidth()
  height = image:getHeight()

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
  if onGame == false then
      if love.keyboard.isDown('n') then
        onGame = true
      elseif love.keyboard.isDown('q') then
        love.event.quit()
      end
  elseif onGame == true then
    player:update(dt)
    canvas:update(dt, player, listOfEnemies)
  
  
  for i,e in ipairs(listOfEnemies) do
        e:update(dt, player)
        player:checkCollision(e)
    end
  end
end

function love.draw()
  love.graphics.draw(image, -1, -1)
  
  if onGame == false then
      love.graphics.print("New Game (N)", love.graphics.getWidth() / 2 - 50, love.graphics.getHeight() / 2 - 25, 0, 1, 1)
      love.graphics.print("Quit (Q)", love.graphics.getWidth() / 2 - 30, love.graphics.getHeight() / 2, 0, 1, 1)
    --Menu
      
  elseif onGame == true then
    canvas:draw()
    player:draw()
  
    for i,e in ipairs(listOfEnemies) do
      e:draw()
    end
  end
end