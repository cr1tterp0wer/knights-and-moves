
require_relative 'node.rb'

require 'byebug'

class Board


  def initialize(len=8)
    @grid = Array.new(len) { Array.new(len) { nil } }
    initBoard
  end

  def initBoard
    @grid.each_with_index do |row, i|
      row.each_index do |j|
        @grid[i][j] = Node.new([i,j])
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def valid_moves(pos)
    positions=[]
    row,col = pos

    positions << [row+2, col+1] if row+2 < @grid.length && col+1 < @grid[0].length
    positions << [row+2, col-1] if row+2 < @grid.length && col-1 >= 0

    positions << [row+1, col+2] if row+1 < @grid.length && col+2 < @grid[0].length
    positions << [row-1, col+2] if row-1 >= 0 && col+2 < @grid[0].length

    positions << [row-2, col+1] if row-2 >=0 && col+1 < @grid[0].length
    positions << [row-2, col-1] if row-2 >=0 && col-1 >= 0

    positions << [row+1, col-2] if row+1 < @grid.length && col-2 >=0
    positions << [row-1, col-2] if row-1 >= 0 && col-2 >=0
    positions
  end







end
