
#Pawn / Bishop / kNight / Tower / Queen / King

class Board  
  def initialize()   
    @square = []   
    gets
    7.times() do |x|
      7.times() do |y|
        sq =  Square.new(Coordenate.new(x,y), Piece.new("E") )    
        p sq
        @square << sq
      end
    end
    
  end
end

class Square
  attr_accessor :coordenate, :content    
  
  def initialize(coordenate,content)
      @coordenate = coordenate
      @content = content
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
casilla = Square.new(Coordenate.new(1,2),"P")
puts casilla.coordenate.x
puts casilla.coordenate.y
p casilla.coordenate.to_arr
board_new=Board.new
p board_new
