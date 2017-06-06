function love.load()
  Object = require "classic"
  require "PlayerController"
  pla = PlayerController(700, 500, 200)
end

function love.update(dt)
    pla:update(dt)
end

function love.draw()
    pla:draw()
end