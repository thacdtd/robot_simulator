require 'spec_helper'

describe Robot do
  describe 'when create default robot' do
    let(:robot) { Robot.new }

    it 'has position of [0, 0]' do
      expect(robot.position.coordinates).to eq [0, 0]
    end

    it 'faces to north' do
      expect(robot.direction).to eq DIRECTIONS['north']
    end
  end

  describe 'when #initialize' do
    let(:position) { Position.new('x' => 1, 'y' => 1) }
    let(:new_position) { Position.new('x' => 2, 'y' => 3) }
    let(:table) do
      Table.new('width' => 5, 'height' => 5, 'origin' => { 'x' => 0, 'y' => 0 })
    end
    let(:robot) do
      Robot.new('position' => position, 'direction' => DIRECTIONS['east'])
    end

    it 'has position of [1, 1]' do
      expect(robot.position.coordinates).to eq [1, 1]
    end

    it 'faces to north' do
      expect(robot.direction).to eq DIRECTIONS['east']
    end

    context 'when #place' do
      it 'move to new position' do
        robot.place(new_position, DIRECTIONS['north'])
        expect(robot.position.coordinates).to eq [2, 3]
      end

      it 'faces to new direction' do
        robot.place(new_position, DIRECTIONS['south'])
        expect(robot.direction).to eq DIRECTIONS['south']
      end
    end

    context 'when #left' do
      it 'change direction from east to north' do
        robot.left
        expect(robot.direction).to eq DIRECTIONS['north']
      end

      it 'change direction from north to west' do
        robot.left
        robot.left
        expect(robot.direction).to eq DIRECTIONS['west']
      end

      it 'change direction from west to south' do
        robot.left
        robot.left
        robot.left
        expect(robot.direction).to eq DIRECTIONS['south']
      end

      it 'change direction from south to east' do
        robot.left
        robot.left
        robot.left
        robot.left
        expect(robot.direction).to eq DIRECTIONS['east']
      end
    end

    context 'when #right' do
      it 'change direction from east to south' do
        robot.right
        expect(robot.direction).to eq DIRECTIONS['south']
      end

      it 'change direction from south to west' do
        robot.right
        robot.right
        expect(robot.direction).to eq DIRECTIONS['west']
      end

      it 'change direction from west to north' do
        robot.right
        robot.right
        robot.right
        expect(robot.direction).to eq DIRECTIONS['north']
      end

      it 'change direction from north to east' do
        robot.right
        robot.right
        robot.right
        robot.right
        expect(robot.direction).to eq DIRECTIONS['east']
      end
    end

    context 'when #move' do
      it 'move 1 toward east' do
        robot.move
        expect(robot.direction).to eq DIRECTIONS['east']
        expect(robot.position.coordinates).to eq [2, 1]
      end

      it 'move 1 toward south' do
        robot.right
        robot.move
        expect(robot.direction).to eq DIRECTIONS['south']
        expect(robot.position.coordinates).to eq [1, 0]
      end

      it 'move 1 toward north' do
        robot.left
        robot.move
        expect(robot.direction).to eq DIRECTIONS['north']
        expect(robot.position.coordinates).to eq [1, 2]
      end

      it 'move 1 toward west' do
        robot.left
        robot.left
        robot.move
        expect(robot.direction).to eq DIRECTIONS['west']
        expect(robot.position.coordinates).to eq [0, 1]
      end
    end
  end
end
