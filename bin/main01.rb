#!/usr/bin/env ruby
require_relative '../lib/tuple'

Projectile = Struct.new(:position, :velocity)
Environment = Struct.new(:gravity, :wind)

def tick(projectile, environment)
  new_position = projectile.position + projectile.velocity
  new_velocity = projectile.velocity + environment.gravity + environment.wind
  Projectile.new(new_position, new_velocity)
end

p = Projectile.new(Point.new(0, 1, 0), Vector.new(1, 1, 0).normalize)
e = Environment.new(Vector.new(0, -0.1, 0), Vector.new(-0.01, 0, 0))

ticks = 0
while (p.position.y > 0) do
  p = tick(p, e)
  ticks +=1
  puts "[#{ticks}] x: #{p.position.x}, y:#{p.position.y} z:#{p.position.z}"
end
