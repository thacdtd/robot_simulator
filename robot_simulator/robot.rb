require_relative 'global_constant'

class Robot
  attr_reader :position, :direction

  def initialize(args = {})
    @position = args['position'] || Position.new
    @direction = args['direction'] || north
  end

  def place(position, direction)
    @position = position
    @direction = direction
  end

  def move
    case @direction
    when north
      @position.y += 1
    when south
      @position.y -= 1
    when east
      @position.x += 1
    when west
      @position.x -= 1
    else
      raise CustomError::InvalidDirection
    end
  end

  def left
    rotate(false)
  end

  def right
    rotate(true)
  end

  def report
    ">> OUTPUT: #{@position.x}, #{@position.y}, #{@direction}"
  end

  private

  def rotate(clockwise = true)
    case @direction
    when north
      clockwise ? @direction = east : @direction = west
    when east
      clockwise ? @direction = south : @direction = north
    when south
      clockwise ? @direction = west : @direction = east
    when west
      clockwise ? @direction = north : @direction = south
    else
      raise CustomError::InvalidDirection
    end
  end

  def north
    DIRECTIONS['north']
  end

  def south
    DIRECTIONS['south']
  end

  def east
    DIRECTIONS['east']
  end

  def west
    DIRECTIONS['west']
  end
end
