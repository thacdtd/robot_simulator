require './robot_simulator/simulator'
require './robot_simulator/global_constant'

RSpec.configure do |config|
  # Configure the Rspec to only accept the new syntax on new projects,
  # to avoid having the 2 syntax all over the place.
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
