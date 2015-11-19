require 'spec_helper'

describe Position do
  describe 'when create default position' do
    let(:position) { Position.new }

    it 'has x value of 0' do
      expect(position.x).to eq 0
    end

    it 'has y value of 0' do
      expect(position.y).to eq 0
    end
  end

  describe 'when #initialize' do
    let(:position) { Position.new('x' => 1, 'y' => 2) }
    let(:table) do
      Table.new('width' => 5, 'height' => 5, 'origin' => { 'x' => 0, 'y' => 0 })
    end

    it 'has x value of 1' do
      expect(position.x).to eq 1
    end

    it 'has y value of 0' do
      expect(position.y).to eq 2
    end

    it 'has coordinates value of [1, 2]' do
      expect(position.coordinates).to eq [1, 2]
    end

    it 'checks that position is inside table' do
      expect(position.valid?(table)).to eq true
    end

    it 'checks that x value is inside table' do
      expect(position.x_valid?(table)).to eq true
    end

    it 'checks that y value is inside table' do
      expect(position.y_valid?(table)).to eq true
    end

    context 'when x value is greater than the right most of the table' do
      it 'checks that x value is invalid' do
        position.x += 5
        expect(position.x_valid?(table)).to eq false
      end

      it 'checks that position is invalid' do
        position.x += 5
        expect(position.valid?(table)).to eq false
      end
    end

    context 'when x value is smaller than the left most of the table' do
      it 'checks that x value is invalid' do
        position.x -= 5
        expect(position.x_valid?(table)).to eq false
      end

      it 'checks that position is invalid' do
        position.x -= 5
        expect(position.valid?(table)).to eq false
      end
    end

    context 'when y value is greater than the top most of the table' do
      it 'checks that x value is invalid' do
        position.y += 5
        expect(position.y_valid?(table)).to eq false
      end

      it 'checks that position is invalid' do
        position.y += 5
        expect(position.valid?(table)).to eq false
      end
    end

    context 'when x value is smaller than the bottom most of the table' do
      it 'checks that x value is invalid' do
        position.y -= 5
        expect(position.y_valid?(table)).to eq false
      end

      it 'checks that position is invalid' do
        position.y -= 5
        expect(position.valid?(table)).to eq false
      end
    end

    context 'when adding ratio to x, y' do
      it 'checks that ratio adding to x value is valid' do
        expect(position.ratio_x_valid?(2, table)).to eq true
      end

      it 'checks that ratio adding to y value is valid' do
        expect(position.ratio_y_valid?(2, table)).to eq true
      end

      it 'checks that ratio adding to x value is not an integer' do
        expect(position.ratio_x_valid?(2.5, table)).to eq false
      end

      it 'checks that ratio adding to y value is not an integer' do
        expect(position.ratio_y_valid?(2.5, table)).to eq false
      end

      it 'checks that ratio adding to x value is not valid (outside table)' do
        expect(position.ratio_x_valid?(5, table)).to eq false
      end

      it 'checks that ratio adding to y value is not valid (outside table)' do
        expect(position.ratio_y_valid?(5, table)).to eq false
      end
    end
  end
end
