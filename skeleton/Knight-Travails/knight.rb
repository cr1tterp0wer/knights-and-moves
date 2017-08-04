
require_relative 'board.rb'

require 'byebug'

class KnightPathFinder

  attr_reader :board, :start_pos
  def initialize(pos)
    @board = Board.new
    @start_pos = pos
    @visited_positions = [pos]
  end

  def find_path(end_pos)
    current_node = @board[@start_pos]
    node_list = [current_node]
    until node_list.empty? || current_node.found?(end_pos)
      current_node = node_list.shift
      valid_positions = @board.valid_moves(current_node.pos)
      valid_positions.each do |pos|
        unless @visited_positions.include?(pos)
          #  debugger
          @board[pos].parent = current_node
          node_list << @board[pos]
          @visited_positions << pos
        end
      end
    end

    trace_path_back(current_node) if current_node.found?(end_pos)

  end

  def trace_path_back(current_node)
    tracked = [current_node.pos]
    tracked_pos = current_node.pos
    until @board[tracked_pos].parent.nil?
      # puts tracked_pos.to_s
      tracked_pos = @board[tracked_pos].parent.pos
      tracked << tracked_pos
    end
    puts tracked.reverse.to_s
    tracked.reverse
  end


end


a = KnightPathFinder.new([0,0])
a.find_path([7,7])
