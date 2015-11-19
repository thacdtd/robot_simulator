require 'spec_helper'

describe Simulator do
  describe 'when #initialize' do
    let(:table) { Table.new }
    let(:robot) { Robot.new }
    let(:simulator) { Simulator.new('table' => table, 'robot' => robot) }

    describe 'when #exec(commnand)' do
      context 'when #PLACE has not been executed' do
        it 'prevents #MOVE from being executed' do
          expect do
            simulator.exec('MOVE')
          end.to raise_error(CustomError::InvalidCommand)
        end

        it 'prevents #LEFT from being executed' do
          expect do
            simulator.exec('LEFT')
          end.to raise_error(CustomError::InvalidCommand)
        end

        it 'prevents #RIGHT from being executed' do
          expect do
            simulator.exec('RIGHT')
          end.to raise_error(CustomError::InvalidCommand)
        end
      end

      context 'when #PLACE has wrong arguments' do
        it 'raise error for invalid place command' do
          expect do
            simulator.exec('PLACE')
          end.to raise_error(CustomError::InvalidPlaceCommand)
        end
      end

      context 'when #PLACE robot to the wrong position (outside the table)' do
        it 'raises error for invalid position' do
          expect do
            simulator.exec('PLACE 6,6,NORTH')
          end.to raise_error(CustomError::InvalidPosition)
        end
      end
    end
  end
end
