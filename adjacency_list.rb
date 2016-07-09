require_relative 'edge_list'
require_relative 'linked_list'
class AdjacencyList

  def initialize(edge_list)
    @edge_list = edge_list
    @adj_list = []

    @matrix_size = edge_list.size
    @matrix = Array.new(@matrix_size){Array.new(@matrix_size, 'X')}

    @edge_list.each_with_index do |x,i|
      @matrix[x[0].id][x[1].id] = x[2]
    end

    @id_lookup = []
    @edge_list.each do |x|
     @id_lookup[x[0].id] = x[0].name
     @id_lookup[x[1].id] = x[1].name
    end

    @id_lookup.each_with_index do |x,i|
      @adj_list[i] = LinkedList.new
      @adj_list[i].add_node(@id_lookup[i],'0')
      @matrix[i].each_with_index do |y,j|
        @adj_list[i].add_node(@id_lookup[j], y) if y != 0 && j != 0
      end
    end
  end

  def print_list
    @adj_list.each do |x|
      x.print_list
    end
  end

  def edge_weight(first, last)
    result = @adj_list[first].find_node(last)
    puts result.data2
  end

end

# Set up the structure
the_list = EdgeList.new( 5 )
el = the_list.list
am = AdjacencyList.new( el )

am.print_list
am.edge_weight(3,1)
# the_list.print_list
