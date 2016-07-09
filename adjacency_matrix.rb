require_relative 'edge_list'
class AdjacencyMatrix

  def initialize(edge_list)
    @edge_list = edge_list
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

  end

  def print_matrix
    @matrix.each_with_index do |x,i|
      print "     #{@id_lookup[i]} "
    end
    puts
    @matrix.each_with_index do |x,i|
      print "#{@id_lookup[i]} "
      x.each do |y|
         print "#{y}          "
      end
      puts "\n"
    end
  end

  def edge_weight(first, last)
    puts @matrix[first][last]
  end

end

# Set up the structure
the_list = EdgeList.new( 5 )
el = the_list.list
am = AdjacencyMatrix.new( el )

am.print_matrix
am.edge_weight(0,2)
