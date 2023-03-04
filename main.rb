# Pawn / Bishop / kNight / Tower / Queen / King
# coordinate class its not working as intended. the idea is to reduce 
# memory use. so many new coordinates quite the oposite
# Board have 64 squares, saved in @allboard
# Squares have @x and @y, and @content
# @content have a pointer to a piece
# piece class have 32 pointers in @@id with all pieces and their data (@name, @team)

class Board  
  attr_accessor :allboard, :allpieces
  

  def initialize() # starts board with empty squares
    @allboard = []    
    @allpieces = SetOfPieces.new
    
    reset_board()    
    8.times do |y|
      8.times do |x|
        sq = Square.new(x, y, @allpieces.id('e'))
        @allboard << sq
      end
    end
  end

  def show_board 
    cont = 0
    puts '      BOARD'
    print '8 '
    @allboard.each { |sq| print sq.content.name + ' ' if sq.y == 7 }
    print "\n" + '7 '
    @allboard.each { |sq| print sq.content.name + ' ' if sq.y == 6 }
    print "\n" + '6 '
    @allboard.each { |sq| print sq.content.name + ' ' if sq.y == 5 }
    print "\n" + '5 '
    @allboard.each { |sq| print sq.content.name + ' ' if sq.y == 4 }
    print "\n" + '4 '
    @allboard.each { |sq| print sq.content.name + ' ' if sq.y == 3 }
    print "\n" + '3 '
    @allboard.each { |sq| print sq.content.name + ' ' if sq.y == 2 }
    print "\n" + '2 '
    @allboard.each { |sq| print sq.content.name + ' ' if sq.y == 1 }
    print "\n" + '1 '
    @allboard.each { |sq| print sq.content.name + ' ' if sq.y == 0 }
    print "\n"
    puts '  A B C D E F G H'
    print "\n"
  end

  def change_piece(x,y,new_piece)
    @allboard.each do |sq|
      if sq.x == x && sq.y == y 
        sq.content = new_piece
        return sq
      end
    end
  end

  def reset_board()
 
  end

  def return_square_by_coord(x,y)
    arr = @allboard.select { |sq| sq.x == x && sq.y == y }
    p arr[0]
    return arr[0]
  end

 
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


  def initialize()    
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

  def show_ids()
    puts @@id
  end

  

end      

class Pieces
  attr_accessor :name, :team, :eated

  def initialize(name, team = nil)
    @name = name
    @team = team
    @eated = false    
  end


end


board_new = Board.new
board_new.show_board
board_new.change_piece(0,0, board_new.allpieces.id('p1','w'))
board_new.show_board
