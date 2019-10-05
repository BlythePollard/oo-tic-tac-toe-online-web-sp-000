class TicTacToe
   def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  #def initialize 
   # @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  #end
  
  WIN_COMBINATIONS = [
     [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
    
   def display_board
    #based on @board, print current board representation
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input) 
  user_input.to_i - 1
end

def move(user_input, value)
  #takes 2 arguments: index in @board array, token x or o (default to x)
  @board[user_input.to_i] = value
end

def position_taken?(user_input)
  #evaluate user's desired move against the board
  #check to see whether that position is occupied, returning true if occupied, false if open
  #checks using index values b/c running after input to index
  if @board[user_input] == " " || @board[user_input] == "" || @board[user_input] == nil
    false
  else true
end
end

def valid_move?(user_input)
  #accept a position, check and return true if move is valid, false/nil if not
  user_input.between?(0,8) && !position_taken?(user_input)
end

def turn
  #ask user to for move 1-9
  #receive input
  #translate input into index value
  #if move is valid, make move and display board
  #if move invalid, ask for new move until valid move received
  
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else 
    turn
  end
 end
 
 def turn_count
   #return number of turns played based on @board
 counter = 0 #counter at 0
    board.each do |space| #check array starting at 0
      if space == "X" || space == "O" #if space is taken
      counter += 1 #then count one more
    end
  end
  counter
end  

def current_player
  #use turn_count method to determine whose turn it is
    if turn_count.even?
       "X"
    else 
       "O"
  end
end

def won?
  #use WIN_COMBINATIONS constant to return false.nil if no win combo, return winning combo indexes as array if there is win
  WIN_COMBINATIONS.each do |win_combination| 
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
          
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
          

    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
        return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end
  
def full?
  #returns true if every element on board contains x or o
  board.all? do |position|
  position == "X" || position == "O" 
end
end

def draw?
  #returns true if board is full & hasn't been won, false if board is won, false if board isn't full or won
  full?(board) && !won?(board)
end

def over?
  #returns true if board has been won or is full
  won?(board) || draw?(board)
end

def winner(board)
  #givenb winning @board, returns x or o who has won
  over?(board) #make sure it's over
  if won?(board) #see if anyone won, return that array
    index = won?(board)[0] #index = first unit of winning array
    board[index] #retrieve value of that first unit
  elsif false  
end
end

def play
  #main method--responsible for game loop
  #Allow players to take turns, check if game is over after every turn
  #at end of game, reports outcome of game
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

end