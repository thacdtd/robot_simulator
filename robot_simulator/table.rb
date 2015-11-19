class Table
  attr_reader :height, :width, :origin

  def initialize(args = {})
    @height = args['height'] || 5
    @width = args['width'] || 5
    @origin = args['origin'] || { 'x' => 0, 'y' => 0 }
  end
end
