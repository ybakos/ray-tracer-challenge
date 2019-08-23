#!/usr/bin/env ruby
require_relative '../lib/tuple'
require_relative '../lib/canvas'

Projectile = Struct.new(:position, :velocity)
Environment = Struct.new(:gravity, :wind)

def tick(projectile, environment)
  new_position = projectile.position + projectile.velocity
  new_velocity = projectile.velocity + environment.gravity + environment.wind
  Projectile.new(new_position, new_velocity)
end

p = Projectile.new(Point.new(0, 1, 0), Vector.new(1, 1.8, 0).normalize * 11.25)
e = Environment.new(Vector.new(0, -0.1, 0), Vector.new(-0.01, 0, 0))

c = Canvas.new(900, 550)

def off_canvas?(x, y, width, height)
  x < 0 || x > width || y < 0 || y > height
end

ticks = 0
while (p.position.y > 0) do
  p = tick(p, e)
  ticks +=1
  puts "[#{ticks}] x: #{p.position.x}, y:#{p.position.y} z:#{p.position.z}"
  unless off_canvas?(p.position.x, p.position.y, c.width, c.height)
    c.write_pixel(p.position.x.to_i, c.height - p.position.y.to_i, Color.new(1, 1, 1))
  end
end

File.open('canvas.ppm', 'w') do |f|
  f << c.to_ppm
end
