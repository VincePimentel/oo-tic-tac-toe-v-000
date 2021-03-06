class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8) ? true : false
  end

  def turn_count
    @board.count{|x| x != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter a number 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] &&
        @board[combo[0]] == @board[combo[2]] &&
        position_taken?(combo[0])
        return combo
      end
    end
    return false
  end

  def full?
    @board.include?(" ") ? false : true
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    won? || full? || draw? ? true : false
  end

  def winner
    !won? ? nil : @board[won?[0]] == "X" ? "X" : "O"
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
