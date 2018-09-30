class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
  end
  
  def play
    until over?
      turn
      if won?
        winner
        puts "Congratulation #{winner}!"
        break
      elsif draw?
        puts "Draw"
        break
      end
    end
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
    ]
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move
    @board[index] = current_player
  end
  
  def position_taken?(index)
    @board[index].include?("X") || @board[index].include?("O")
  end
  
  def valid_move?
    @index.between?(0,8) && !position_taken?(@index) 
  end
  
  def turn
    puts "Make yo move 1-9: "
    input = gets.strip
    index = input_to_index(input)
    
    if valid_move?
      move
      turn_count
      current_player
      display_board
    else
      turn
    end
  end
  
  def turn_count
    @board.count {|token| token =="X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]]==@board[win_combo[2]] && @board[win_combo[2]]!=" "
        win_combo
      end
    end
  end
  
  def full?
    turn_count == 9
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    @board[won?[0]]
  end
  

end