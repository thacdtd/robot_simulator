require_relative 'table'
require_relative 'robot'
require_relative 'position'
require_relative 'custom_error'

class Simulator
  def initialize(args = {})
    @table = args['table']
    @robot = args['robot']
    @placed = false
  end

  def exec(command)
    tokens = command.split(/\s+/)
    cmd = tokens[0]
    args = tokens[1]
    case cmd
    when 'PLACE'
      place(args)
    when 'MOVE'
      move
    when 'LEFT'
      left
    when 'RIGHT'
      right
    when 'REPORT'
      puts report
    else
      raise "Invalid command: #{cmd}"
    end
  end

  private

  def place(args)
    raise CustomError::InvalidPlaceCommand if args.nil?

    arg_list = args.split(',')
    new_x = arg_list[0].to_i
    new_y = arg_list[1].to_i
    new_direction = arg_list[2]

    new_position = Position.new('x' => new_x, 'y' => new_y)

    raise CustomError::InvalidPosition unless new_position.valid?(@table)

    raise CustomError::InvalidDirection unless valid_direction?(new_direction)
    @robot = Robot.new('position' => new_position, 'direction' => new_direction)
    @placed = true
  end

  def move
    raise CustomError::InvalidCommand unless @placed
    raise CustomError::InvalidMove unless valid_move?

    @robot.move
  end

  def left
    raise CustomError::InvalidCommand unless @placed

    @robot.left
  end

  def right
    raise CustomError::InvalidCommand unless @placed

    @robot.right
  end

  def report
    raise CustomError::InvalidCommand unless @placed

    @robot.report
  end

  private

  def valid_direction?(direction)
    DIRECTIONS.value?(direction) ? true : false
  end

  def valid_move?
    case @robot.direction
    when north
      @robot.position.ratio_y_valid?(1, @table)
    when south
      @robot.position.ratio_y_valid?(-1, @table)
    when east
      @robot.position.ratio_x_valid?(1, @table)
    when west
      @robot.position.ratio_x_valid?(-1, @table)
    else
      false
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
