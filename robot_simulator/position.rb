class Position
  attr_accessor :x, :y

  def initialize(args = {})
    @x = args['x'] || 0
    @y = args['y'] || 0
  end

  def coordinates
    [@x, @y]
  end

  def valid?(table)
    (x_valid?(table) && y_valid?(table)) ? true : false
  end

  def x_valid?(table)
    left_most_position = table.origin['x']
    right_most_position = table.origin['x'] + table.width - 1
    (@x > right_most_position || @x < left_most_position) ? false : true
  end

  def y_valid?(table)
    bottom_most_position = table.origin['y']
    top_most_position = table.origin['y'] + table.height - 1
    (@y > top_most_position || @y < bottom_most_position) ? false : true
  end

  def ratio_x_valid?(ratio_x, table)
    return false if (ratio_x.to_i != ratio_x.to_f)
    new_x = @x + ratio_x
    left_most_position = table.origin['x']
    right_most_position = table.origin['x'] + table.width - 1
    (new_x > right_most_position || new_x < left_most_position) ? false : true
  end

  def ratio_y_valid?(ratio_y, table)
    return false if (ratio_y.to_i != ratio_y.to_f)
    new_y = @y + ratio_y
    bottom_most_position = table.origin['y']
    top_most_position = table.origin['y'] + table.height - 1
    (new_y > top_most_position || new_y < bottom_most_position) ? false : true
  end
end
