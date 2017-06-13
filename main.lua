function love.load()
  Object = require "classic"
  require "PlayerController"
  require "EnemyController"
  require "CanvasController"
  
  canvas = CanvasController()
  pla = PlayerController(700, 500, 200)
  ene = EnemyController(25, 50, 400)
end

function love.update(dt)
  canvas:update(dt)
  pla:update(dt)
  ene:update(dt, canvas)
  
  pla:checkCollision(ene)
end

function love.draw()
  canvas:draw()
  pla:draw()
  ene:draw()
end