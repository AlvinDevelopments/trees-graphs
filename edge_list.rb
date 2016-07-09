# Creates an Edge List of People
# e.g. [  [Person1, Person2, weight],
#         [Person4, Person8, weight],
#         ... ]
# require 'pry-byebug'

Person = Struct.new(:id, :name)

NAMES = [
  "Harry", "Sally", "Sam", "Michael", "Michelle", "Alok", "Dan", "Nick", "Olga", "Alice", "Joseph", "Donald", "Garrett", "Xin", "Mike", "Adam", "Peter", "Andur", "Tom", "Boris"
  ].sort

# For fake randomness
PIDIGITS = ["3", "1", "4", "1", "5", "9", "2", "6", "5", "3", "5", "8", "9", "7", "9", "3", "2", "3", "8", "4", "6"]


class EdgeList

  attr_reader :list

  # Max members are 20
  # Density is a number between 1-10 which gives the
  #   overall density of edges in the list
  def initialize( list_members = 20, density = 4 )

    list_members = [[list_members, NAMES.size].min, 2].max
    density = [[density, 10].min, 0].max

    @people = build_people( list_members )
    @list = build_list( density )

  end

def build_people( list_members )
  people = []
  NAMES[0..list_members-1].each_with_index do |name,i|
    people << Person.new( i, name )
  end
  return people
end


def build_list( density )

  list = []
  possible_pairs = @people.combination(2)

  possible_pairs.each_with_index do |pair, idx|

    digits_index = idx % PIDIGITS.size

    # Again, pseudo-randomness...
    if PIDIGITS[digits_index].to_i < density
      weight = digits_index + 1
      list << pair + [weight]
    end
  end

  puts "EDGE LIST SIZE: #{list.size}"

  list
end


def print_list
  puts "Your Edge List:"
  puts @list.inspect
  puts "****************"
end

end


# Build and print a new edge list using the provided class
# Here: 10 members (choose 2-20), 4 density (choose 1-10)
# e = EdgeList.new( 10, 4 )
# e.print_list
