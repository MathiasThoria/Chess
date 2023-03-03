
#Pawn / Bishop / kNight / Tower / Queen / King
#coordinate class its not working as intended. the idea is to reduce 
#memory use. so many new coordinates quite the oposite

class Board  
  
  def initialize()   #starts board with emty squares
    @square = []      
    8.times do |y|
      8.times do |x|
        sq =  Square.new(Coordenate.new(x,y), Piece.new("E") )    
        #print sq.coordenate.x 
        #print sq.coordenate.y
        #print sq.piece.name
        #print "\n"
        @square << sq        
      end
      #print "\n"
    end    
  end
  
  def show_board 
    cont = 0
    buf = Hash.new("")
    #@square.each {|sq| p sq.coordenate.x}  
    @square.each {|sq|
      #print sq.coordenate.y
      #puts sq.piece.name
      p buf[sq.coordenate.y]
      
      buf[sq.coordenate.y].concat(sq.piece.name)
       
      
      #buf[sq.coordenate.y].concat(sq.piece.name)
      #buf[sq.coordenate.y].concat(" ")   
    }
    p buf
    buf = []
  end

  def change_piece(coordenate, new_piece)  
    @square.each do |sq|
      if sq.coordenate.to_arr == coordenate.to_arr
        sq.piece = new_piece
        return sq
      end
    end
  end

end #end of Board class
  
class Square
  attr_accessor :coordenate, :piece     
  def initialize(coordenate,content)
      @coordenate = coordenate
      @piece = content
  end
  
end

class Coordenate
  attr_accessor :x, :y
  
  def initialize(x,y)
    @x=x
    @y=y
  end
  
  def to_arr
    return [@x,@y]
  end
end  

class Piece
  attr_accessor :name
  def initialize (name)
    @name = name
  end
end      

board_new = Board.new
board_new.show_board
board_new.change_piece(Coordenate.new(0,0),Piece.new("P"))
board_new.show_board
