class TicTacToe
  def initialize(board = nil)
    @board = board
    board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0, 1, 2], #Top row 
  [3, 4, 5], #Middle row 
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Left column
  [1, 4, 7], #Middle column
  [2, 5, 8], #Right column
  [0, 4, 8], #Diagonal 1 
  [2, 4, 6], #Diagonal 2 
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 

  def input_to_index(input)
    input = input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8) 
      TRUE
    else
      FALSE 
    end
  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == TRUE
      move(index, current_player)
      return display_board
    else
      until valid_move?(board, index) == TRUE
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
      end
    end
  end
  
  
end