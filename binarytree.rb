require 'colorize'
class BinaryTree

  Node = Struct.new(:left, :right, :data)

  def initialize(data)
    @levels = Array.new(data.size){Array.new}
    @level_count = 0
    @current_node = nil
    data.each_with_index do |item, i|
      new_node = Node.new(nil, nil, item)
      if(i==0)
        @root_node = new_node
        @current_node = @root_node
        @levels[@level_count] << new_node
      else
        add_node(new_node)
      end
    end
  end

  def add_node(item)
    @level_count += 1
    if item.data < @current_node.data
      if @current_node.left.nil?
        @current_node.left = item
        @levels[@level_count] << item
        @level_count = 0
        @current_node = @root_node
      else
        @current_node = @current_node.left
        add_node(item)
      end
    elsif item.data > @current_node.data
      if @current_node.right.nil?
        @current_node.right = item
        @levels[@level_count] << item
        @level_count = 0
        @current_node = @root_node
      else
        @current_node = @current_node.right
        add_node(item)
      end
    end
  end

  def render
    puts @root_node.data
    @levels.each_with_index do |list, level|
      list.each do |item|
        print "#{item.left.data} " if !item.left.nil?
        print "#{item.right.data} " if !item.right.nil?
      end
      puts
    end
  end





end

b = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
b.render
