require 'ruby2d'
require 'math'

require_relative 'vector'


class Mouse < Vec2
  def initialize(x = 0, y = 0)
  end

  def calc_turn
  end

  def calc_fire
  end
end

class Gun
  def initialize(playerX = 0, playerY = 0, size: 50)
  end

  def shoot
end

class Player
  attr_accessor :name, :health, :damage, :currlevel, :currdirection
  attr_accessor :position, :collider
  attr_accessor :velocity, :velX, :velY

  alias :pos :position
  alias :vel :velocity

  module Directions
    Left = 1
    Right = 2
    Up = 3
    Down = 4
    Stop = 5
  end

  def initialize(object: Square.new, object_size: 25, name: "Player", health: 100, damage: 100, position: [50,50], dt: 2, currlevel: 1)
    @object = object
    @object_size = object_size

    @name = name
    @health = health
    @damage = damage

    @currlevel = currlevel
    @currdirection = Directions::Stop

    @position = position.is_a?(Vec2) ? position : Vec2.new(position)
    @x = position.is_a?(Vec2) ? position.x : position[0]
    @y = position.is_a?(Vec2) ? position.y : position[1]

    @collider = {}

    @velocity = Vec2.new(dt, dt)
    @dt = dt
    @velX = @velocity.x
    @velY = @velocity.y

    @gun = Gun.new(position.x, position.y, size: object_size * 2)
  end


  def update
    @x = (@x + @velX) % Window.width
    @y = (@y + @velY) % Window.height

    draw(@x, @y)

    mouse_pos = Vec2.new
    mouse_pos.set_x(Window.mouse_x)
    mouse_pos.set_y(Window.mouse_y)

    move_stop
  end

  def draw(x, y)
    if @object.is_a?(Square)
      @object = Square.new(x: @x, y: @y, size: @object_size, color: 'red')
    else
    end
  end

  def fire_gun(mouse_pos)
    @gun.shoot(mouse_pos)
  end

  def move_left
    @velX = -@dt
    @velY = 0
    @currdirection = Directions::Left
  end

  def move_right
    @velX = @dt
    @velY = 0
    @currdirection = Directions::Right
  end

  def move_up
    @velX = 0
    @velY = -@dt
    @currdirection = Directions::Up
  end

  def move_down
    @velX = 0
    @velY = @dt
    @currdirection = Directions::Down
  end

  def move_stop
    @velX = 0
    @velY = 0
    @currdirection = Directions::Stop
  end

  def check_for_collisions
    if @square && colission_detected?
      @x_velocity = -@x_velocity
      @y_velocity = -@y_velocity
    end
  end

  def colission_detected?
    ($boxes - Array(self)).any? do |other_box|
      other_box.include?(@square)
    end
  end

  def include?(other_square)
    @square.contains?(other_square.x1, other_square.y1) ||
    @square.contains?(other_square.x2, other_square.y2) ||
    @square.contains?(other_square.x3, other_square.y3) ||
    @square.contains?(other_square.x4, other_square.y4)
  end

  def position=(value)
    if !value.is_a?(Vec2) && value.length == 2 then
      @position = Vec2.set(value)
    else
      @position = value
    end
  end

  def x=(value)
    @x = value
    position.set_x(value)
  end

  def y=(value)
    @y = value
    position.set_y(value)
  end

  def positionX=(value)
    @position.set_x(valu,)
  end

  def positionY=(value)
    @position.set_y(value)
  end

  def get_pos
    return @player.get_pos
  end

  def velocity=(value)
    if !value.is_a?(Vec2) && value.length == 2 then
      @velocity = value
    else
      @velocity = Vec2.set(value[0], value[1])
    end
  end

  def velX=(value)
    @velX = value
    @velocity.set_x(value)
  end

  def velY=(value)
    @velY = value
    @velocity.set_y(value)
  end

  def change_lvl(lvl)
    @currlevel = lvl
  end

  def change_name(name)
    @name = name
  end

  def set_health(health)
    @health = health
  end

  def set_damage(damage)
    @damage = damage
  end

end
