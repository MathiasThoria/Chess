# Pawn / Bishop / kNight / Tower / Queen / King
# coordinate class its not working as intended. the idea is to reduce 
# memory use. so many new coordinates quite the oposite
# Board have 64 squares, saved in @allsq
# Squares have @x and @y, and @content
# @content have a pointer to a piece
# piece class have 32 pointers in @@id with all pieces and their data (@name, @team)

class Board  
  attr_accessor :allsq, :allpieces
  

  def initialize
    @allsq = []    
    @allpieces = SetOfPieces.new

    8.times do |y|
      8.times do |x|
        @allsq << Square.new(x, y, @allpieces.id('e'))
      end
    end
    
    starting_order

  end

  def show_board 
    cont = 0
    puts '      BOARD'
    print '8 '
    @allsq.each { |sq| print sq.content.label + ' ' if sq.y == 7 }
    print "\n" + '7 '
    @allsq.each { |sq| print sq.content.label + ' ' if sq.y == 6 }
    print "\n" + '6 '
    @allsq.each { |sq| print sq.content.label + ' ' if sq.y == 5 }
    print "\n" + '5 '
    @allsq.each { |sq| print sq.content.label + ' ' if sq.y == 4 }
    print "\n" + '4 '
    @allsq.each { |sq| print sq.content.label + ' ' if sq.y == 3 }
    print "\n" + '3 '
    @allsq.each { |sq| print sq.content.label + ' ' if sq.y == 2 }
    print "\n" + '2 '
    @allsq.each { |sq| print sq.content.label + ' ' if sq.y == 1 }
    print "\n" + '1 '
    @allsq.each { |sq| print sq.content.label + ' ' if sq.y == 0 }
    print "\n"
    puts '  A B C D E F G H'
    print "\n"
  end

  def change_piece(x,y,new_piece)
    @allsq.each do |sq|
      if sq.x == x && sq.y == y 
        sq.content = new_piece
        return sq
      end
    end
  end

  def starting_order
    change_piece(0,0, @allpieces.id('t1','w'))
    change_piece(1,0, @allpieces.id('n1','w'))
    change_piece(2,0, @allpieces.id('b1','w'))
    change_piece(3,0, @allpieces.id('q','w'))
    change_piece(4,0, @allpieces.id('k','w'))
    change_piece(5,0, @allpieces.id('b2','w'))
    change_piece(6,0, @allpieces.id('n2','w'))
    change_piece(7,0, @allpieces.id('t2','w'))
    change_piece(0,1, @allpieces.id('p1','w'))
    change_piece(1,1, @allpieces.id('p2','w'))
    change_piece(2,1, @allpieces.id('p3','w'))
    change_piece(3,1, @allpieces.id('p4','w'))
    change_piece(4,1, @allpieces.id('p5','w'))
    change_piece(5,1, @allpieces.id('p6','w'))
    change_piece(6,1, @allpieces.id('p7','w'))
    change_piece(7,1, @allpieces.id('p8','w'))

    change_piece(0,7, @allpieces.id('t1','b'))
    change_piece(1,7, @allpieces.id('n1','b'))
    change_piece(2,7, @allpieces.id('b1','b'))
    change_piece(3,7, @allpieces.id('q','b'))
    change_piece(4,7, @allpieces.id('k','b'))
    change_piece(5,7, @allpieces.id('b2','b'))
    change_piece(6,7, @allpieces.id('n2','b'))
    change_piece(7,7, @allpieces.id('t2','b'))
    change_piece(0,6, @allpieces.id('p1','b'))
    change_piece(1,6, @allpieces.id('p2','b'))
    change_piece(2,6, @allpieces.id('p3','b'))
    change_piece(3,6, @allpieces.id('p4','b'))
    change_piece(4,6, @allpieces.id('p5','b'))
    change_piece(5,6, @allpieces.id('p6','b'))
    change_piece(6,6, @allpieces.id('p7','b'))
    change_piece(7,6, @allpieces.id('p8','b'))
  end

  #def return_square_by_coord(x,y)
   # arr = @allsq.select { |sq| sq.x == x && sq.y == y }
   # p arr[0]
   # return arr[0]
 # end

 
end
# end of Board class

class Square
  attr_accessor :content, :piece, :x, :y

  def initialize(x,y,content)
    @x = x
    @y = y
    @content = content
  end
  

end



class SetOfPieces
  attr_accessor :id


  def initialize
    @id = []
    @id << Pieces.new('e')
    @id << Pieces.new('t1','w')
    @id << Pieces.new('n1','w')
    @id << Pieces.new('b1','w')
    @id << Pieces.new('q','w')
    @id << Pieces.new('k','w')
    @id << Pieces.new('b2','w')
    @id << Pieces.new('n2','w')
    @id << Pieces.new('t2','w')
    @id << Pieces.new('p1','w')
    @id << Pieces.new('p2','w')
    @id << Pieces.new('p3','w')
    @id << Pieces.new('p4','w')
    @id << Pieces.new('p5','w')
    @id << Pieces.new('p6','w')
    @id << Pieces.new('p7','w')
    @id << Pieces.new('p8','w')

    @id << Pieces.new('t1','b')
    @id << Pieces.new('n1','b')
    @id << Pieces.new('b1','b')
    @id << Pieces.new('q','b')
    @id << Pieces.new('k','b')
    @id << Pieces.new('b2','b')
    @id << Pieces.new('n2','b')
    @id << Pieces.new('t2','b')
    @id << Pieces.new('p1','b')
    @id << Pieces.new('p2','b')
    @id << Pieces.new('p3','b')
    @id << Pieces.new('p4','b')
    @id << Pieces.new('p5','b')
    @id << Pieces.new('p6','b')
    @id << Pieces.new('p7','b')
    @id << Pieces.new('p8','b')
  
  end

  def id(name, team = nil)
    arr = @id.select{ |id| id.name == name && id.team == team } 
    return arr[0]
  end

  def show_ids
    puts @@id
  end

  

end      

class Pieces
  attr_accessor :name, :team, :eated, :label

  def initialize(name, team = nil)
    @name = name
    @team = team
    @eated = false
    @label = name[0].capitalize
  end


end


board_new = Board.new
board_new.show_board
board_new.change_piece(0,0, board_new.allpieces.id('p1','w'))
board_new.show_board
