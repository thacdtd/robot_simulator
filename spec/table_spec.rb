require 'spec_helper'

describe Table do
  context 'when created default table (5x5)' do
    let(:table) { Table.new }

    it 'has width 5' do
      expect(table.width).to eq 5
    end

    it 'has height 5' do
      expect(table.height).to eq 5
    end

    it 'has origin x = 0' do
      expect(table.origin['x']).to eq 0
    end

    it 'has origin y = 0' do
      expect(table.origin['y']).to eq 0
    end
  end

  context 'when create 6x9 table with origin [1,1]' do
    let(:table) do
      Table.new('width' => 6,
                'height' => 9,
                'origin' => { 'x' => 1, 'y' => 1 })
    end

    it 'has width 9' do
      expect(table.width).to eq 6
    end

    it 'has height 9' do
      expect(table.height).to eq 9
    end

    it 'has origin x = 1' do
      expect(table.origin['x']).to eq 1
    end

    it 'has origin y = 1' do
      expect(table.origin['y']).to eq 1
    end
  end
end
