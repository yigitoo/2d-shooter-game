class Vec2
  #---
  # ACCESSORS
  attr_accessor :x, :y
  #---
  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end


  def get_coords
    return @x, @y
  end

  def set_coords(coordinates)
    if coordinates.length == 2 then
      @x = coordinates[0].nil? ? @x : coordinates[0]
      @y = coordinates[1].nil? ? @y : coordinates[1]
    end
  end

  #---
  alias :get_pos :get_coords
  alias :set_pos :set_coords
  #---
  alias :get :get_coords
  alias :set :set_coords
  #---
  alias :set_arr :set_coords
  alias :get_arr :get_coords
  #---

  def distance_to_origin
    return @x ** 2 + @y ** 2
  end

  def distance_to_another_object(other)
    return (
      (@x - other.x) ** 2 + (@y - other.y) ** 2
    ).abs
  end

  #---
  alias :distance_origin :distance_to_origin
  alias :calc_distance :distance_to_another_object
  alias :distance :distance_to_another_object
  #---

  def is_intersect(other_colliders)
    for collider in other_colliders
    end
  end

  def [](index)
    case index
      when 0
        return @x
      when 1
        return @y
      else
        return nil
    end
  end

  def []=(index, value)
    case index
      when 0
        @x = value
      when 1
        @y = value
      else
        return
    end
  end

  def ==(other)
    return (
      @x == other.x && @y == other.y
    )
  end

  def +(other)
    @x += other.x
    @x += other.y
  end

  def -(other)
    @x -= other.x
    @y -= other.y
  end

  def get_x
    return @x
  end

  def get_y
    return @y
  end

  def set_x(new_x)
    @x = new_x
  end

  def set_y(new_y)
    @y = new_y
  end

  def info
    puts "Vector2D"
    puts "X: #{@x}"
    puts "Y: #{@y}"
  end
end
