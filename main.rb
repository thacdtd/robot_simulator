#!/usr/bin/env ruby
require_relative './robot_simulator/simulator'
require_relative './robot_simulator/table'
require_relative './robot_simulator/robot'

table = Table.new
robot = Robot.new

robot_simulator = Simulator.new('table' => table, 'robot' => robot)

command = STDIN.gets

tokens = command.split(/\s+/)
if tokens[0] == 'RUN'
  begin
    text = File.open(tokens[1]).read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|
      robot_simulator.exec(line)
    end
  rescue => e
    puts e.message
  end
else
  while command
    begin
      robot_simulator.exec(command)
    rescue => e
      puts e.message
    end
    command = STDIN.gets
  end
end
