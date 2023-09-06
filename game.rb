require 'ruby2d'

require_relative 'constants'
require_relative 'player'
require_relative 'enemy'

set background: Constants::BackgroundColor
set title: Constants::Title
set width: Constants::Width, height: Constants::Height

dt = 4
player = Player.new(dt: dt, object_size: 40)

# Define the initial speed (and direction).

# Define what happens when a specific key is pressed.
# Each keypress influences on the  movement along the x and y axis.
on :key do |event|
  if event.key == 'a'
    player.move_left
  elsif event.key == 'd'
    player.move_right
  elsif event.key == 'w'
    player.move_up
  elsif event.key == 's'
    player.move_down
  end
end

on :mouse_down do |event|
  case event.button
    when :left
      player.fire_gun()
    when :middle
      nil
    when :right
      nil
  end
end

update do
  clear
  player.update
  player.move_stop
end

show
