class PolyTreeNode
  def initialize(value)
    @parent = nil
    @value = value
    @children =[]
  end

  def parent
    @parent
  end

  def parent=(node)
    prev_parent = @parent
    prev_parent.children.delete(self) unless prev_parent.nil?
    @parent = node
    unless node.nil?
      @parent.children << self unless @parent.children.include?(self)
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if self.children.include?(child_node)
      child_node.parent = nil
    else
      raise "you're not the father"
    end
  end

  def children
    @children
  end

  def value
    @value
  end

  def dfs(target_value)
    puts value
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      puts current_node.value
      return current_node if current_node.value == target_value
      current_node.children.each { |child| queue << child }
    end
    nil
  end

end





nodes = ('a'..'g').map { |value| PolyTreeNode.new(value) }

  parent_index = 0
  nodes.each_with_index do |child, index|
    next if index.zero?
    child.parent = nodes[parent_index]
    parent_index += 1 if index.even?
  end

puts "dfs to find e"
nodes[0].dfs('e')
puts "--------"
puts "bfs to find g"
nodes[0].bfs('g')
puts "--------"
puts "dfs to find f"
nodes[0].dfs('f')
puts "--------"
puts "bfs to find c"
nodes[0].bfs('c')
puts "--------"
