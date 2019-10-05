class TicTacToe
   def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
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
  @board[user_input.to_i] = value
end

def position_taken?(user_input)
  if @board[user_input] == " " || @board[user_input] == "" || @board[user_input] == nil
    false
  else true
end
end

def valid_move?(user_input)
  user_input.between?(0,8) && !position_taken?(user_input)
end

def turn
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
 counter = 0 #counter at 0
    @board.each do |space| #check array starting at 0
      if space == "X" || space == "O" #if space is taken
      counter += 1 #then count one more
    end
  end
  counter
end  

def current_player
    if turn_count.even?
       "X"
    else 
       "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination| 
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
          
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
          

    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
        return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end
  
def full?
  @board.all? do |position|
  position == "X" || position == "O" 
end
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  over? 
  if won? 
    index = won?[0] 
    @board[index] 
  elsif false  
end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end