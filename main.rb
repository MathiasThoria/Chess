
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
    #@square.each {|sq| p sq.coordenate.x}
    print cont
    print " "
    @square.each do |sq|        
      if cont == 8 
        print "\n" 
        print sq.coordenate.y
        print " "
        cont = 0
      end
      if cont < 8
        print sq.piece.name
        print " "
        cont += 1
      end
    end
    print "\n "
    8.times {|n| print " #{n}"}
    print "\n"
  end
end

def change_piece(coordenate)  
  
end

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
