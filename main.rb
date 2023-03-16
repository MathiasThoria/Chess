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

  
 def change_piece(x,y,new_piece)
  @allsq.each do |sq|
    if sq.x == x && sq.y == y 
      sq.content = new_piece
      return sq
    end
  end
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

  def id(name, team = nil) # return id by name and team (optional)
    arr = @id.select{ |id| id.name == name && id.color == team } 
    return arr[0]
  end

  def show_ids
    puts @@id
  end

  

end      

class Pieces
  attr_accessor :name, :color, :eated, :label, :legalmoves
  
  def initialize(name, team = nil)
    @name = name
    @color = team
    @eated = false
    @team = team
    @label = name[0].capitalize
    set_legal_moves
  end

  def set_legal_moves
    case @label
    when 'T'
      @legalmoves = [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],
      [0,-1],[0,-2],[0,-3],[0,4],[0,-5],[0,-6],[0,-7],
      [1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],
      [-1,0],[-2,0],[-3,0],[-4,0],[-5,0],[-6,0],[-7,0]]
    when 'B'
      @legalmoves = [[1,1],[2,2],[3,3],[4,4],[5,5],[5,5],[6,6],[7,7],
      [-1,1],[-2,2],[-3,3],[-4,4],[-5,5],[-5,5],[-6,6],[-7,7],
      [1,-1],[2,-2],[3,-3],[4,-4],[5,-5],[5,-5],[6,-6],[7,-7],
      [-1,-1],[-2,-2],[-3,-3],[-4,-4],[-5,-5],[-5,-5],[-6,-6],[-7,-7]]
    when 'N'
      @legalmoves = [[2,1],[2,-1],[-2,1],[-2,-1],
      [1,2],[-1,2],[1,-2],[-1,-2]]
    when 'Q'
      @legalmoves = [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],
      [0,-1],[0,-2],[0,-3],[0,4],[0,-5],[0,-6],[0,-7],
      [1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],
      [-1,0],[-2,0],[-3,0],[-4,0],[-5,0],[-6,0],[-7,0],
      [1,1],[2,2],[3,3],[4,4],[5,5],[5,5],[6,6],[7,7],
      [-1,1],[-2,2],[-3,3],[-4,4],[-5,5],[-5,5],[-6,6],[-7,7],
      [1,-1],[2,-2],[3,-3],[4,-4],[5,-5],[5,-5],[6,-6],[7,-7],
      [-1,-1],[-2,-2],[-3,-3],[-4,-4],[-5,-5],[-5,-5],[-6,-6],[-7,-7]]
    when 'K'
      @legalmoves = [[0,1],[0,-1],[1,0],[-1,0],[1,1],[-1,1],[1,-1],[-1,1]]
    when 'P'      
      @legalmoves = [[0,1],[1,1],[-1,1]] if @team == 'w'
      @legalmoves = [[0,-1],[1,-1],[-1,-1]] if @team == 'b'
    end
  end
end

class Player
  attr_accessor :name,:color
  def initialize(name,color)
    @name=name
    @color=color
  end  
end

class Matchup
  attr_accessor :playerW,:playerB,:board
  def initialize(name1,name2)
    @playerW = name1
    @playerB = name2
    @board = Board.new
  end

  def start
    legalmove = false
    check_mate = false
    gave_up = false

    until check_mate || gave_up
      while ! legalmove     
       
        move = ask_move(playerW, board) # returns an array with origin and destiny square 
        
        if is_move_valid?(move[0],move[1],'w')
          puts "The move is valid"          
          # change destiny
          board.change_piece(move[1].x,move[1].y, move[0].content)
          # change origin
          board.change_piece(move[0].x,move[0].y, board.allpieces.id('e'))
        else
          puts "The move is invalid. Try again." 
        end
        legalmove = true
      end

      gave_up = true
    end
  end

  def ask_move(player, board) # returns an array with 2 squares
    board.show_board
    puts "Player #{player}, please chose your move."
    move = gets.chomp

    piecetomove = move[0]
    piecerank = letter_to_x(move[1]).to_i
    piecey = move[2].to_i - 1
    coordx = letter_to_x(move[3]).to_i
    coordy = move[4].to_i - 1
    
    #easy limit check
    return false unless coordx >= 0 && coordx <= 8 
    return false unless coordy >= 0 && coordy <= 8 
    
    piecetomove = piecetomove.capitalize    
    
    #search origin sq
    sq_arr = board.allsq.select { |sq| sq.x == letter_to_x(piecerank) && sq.y == piecey }
    
    if sq_arr.nil? 
      puts 'Invalid origin Coordenate'
      return false
    else
      sq_origin = sq_arr[0]
    end
   
    sq_arr = nil

    # search destiny sq
    sq_arr = board.allsq.select { |sq| sq.x == coordx && sq.y == coordy }

    if sq_arr.nil? 
      puts 'Invalid destiny coordinate'
      return false
    else
      sq_destiny = sq_arr[0]
    end
   
    return [sq_origin, sq_destiny]
   
  end
   
  def is_move_valid?(sq_origin, sq_destiny,turn)    
    puts "origin"
    
    # destiny in range?    
    puts "In range > #{sq_origin.content.legalmoves.include?([sq_destiny.x,sq_destiny.y])}"
   
    # if destiny is same team -> invalid move
    if sq_destiny.content.color == turn
      return false
    end       
    # if destiny is oposite team and not colission-> eat
    # if not collission
    if collision_in_path?(sq_origin, sq_destiny, board)  
      return false   
    end    

    return true
  end
end

def collision_in_path?(sq_origin, sq_destiny, board)
  # there are 3 types of movement: 
  # horizontal -> y constant
  # vertical -> x constant
  # diagonal -> absolutes x = y
  # so...

  # identify movement
  sq_path = []

  if sq_origin.x == sq_destiny.x 
    puts 'vertical'    
    #select all the squares of path        
    sq_path = board.allsq.select { |sq| (sq.y < sq_destiny.y && sq.y > sq_origin.y) && sq.x == sq_origin.x }          

  elsif sq_origin.y == sq_destiny.y
    puts 'horizontal'
    #select all the squares of path        
    sq_path = board.allsq.select { |sq| (sq.x < sq_destiny.x && sq.x > sq_origin.x) && sq.y == sq_origin.y }    

  else
    puts 'diagonal'
    #select all the squares of path        
    dist = (sq_origin.x - sq_destiny.x).abs    
    for a in 1..dist
      puts "a #{a} dist #{dist} sqpath #{sq_path}"
      sq_path = sq_path.union( board.allsq.select { |sq| sq.x == sq_origin.x + a && sq.y == sq_origin.y + a} )      
    end   
  end

  p "sqpath:"  
  # if sq_path has some piece => its an invalid move
  p sq_path    
  sq_path.select { |sq| sq.content.label != 'e' }
  if sq_path.empty?  # has something else than 'e'?      
    puts "There are not pieces in the path."
    return false 
  else
    puts "There is a colission."
    return true # there is a colission
  end   

end



def letter_to_x(letter)
  letter = letter.capitalize unless letter.is_a? Integer
  case letter
    when 'A'
      return 0  
    when 'B'
      return 1
    when 'C'
      return 2  
    when 'D'
      return 3
    when 'E'
      return 4
    when 'F'
      return 5
    when 'G'
      return 6
    when 'H'
      return 7
    else 
      return letter
  end
end


puts 'Init board'
current_match = Matchup.new('Mathis','Otro')
puts 'Starting Match.'
current_match.start
current_match.board.show_board




