# frozen_string_literal: true

require_relative 'verify_win'
# Create board and check winner
class Game
  include VerifyWin
  attr_reader :player1_symbol, :player2_symbol
  def initialize(player1_symbol, player2_symbol)
    @row1 = []
    @row2 = []
    @row3 = []
    @player_symbol = nil
    @player1_symbol = player1_symbol
    @player2_symbol = player2_symbol
    @player1 = true
    @player_move = nil
    @winner = false
    create_board
  end

  def create_board
    @row1.push(' ', ' ', ' ')
    @row2.push(' ', ' ', ' ')
    @row3.push(' ', ' ', ' ')
    display_board
  end

  def display_board
    p @row1
    p @row2
    p @row3
    play_turn if @winner == false
  end

  def play_turn
    input_player_turn
    switch_player_turn
    assign_player_symbol
    find_index_from_turn
    which_row_to_verify
  end

  def assign_player_symbol
    @player_symbol = if @player1 == true
                       @player2_symbol
                     else
                       @player1_symbol
                     end
  end

  def input_player_turn
    puts "#{player}, where do you want to play?"
    @player_move = gets.chomp
  end

  def switch_player_turn
    @player1 = !(@player1 == true)
  end

  def player
    if @player1 == true
      'Player 1'
    else
      'Player 2'
    end
  end

  def find_index_from_turn
    @index = @player_move[-1].to_i - 1
  end

  def which_row_to_verify
    arr = @player_move.split
    if arr[0] == 'row1'
      verify_row1
    elsif arr[0] == 'row2'
      verify_row2
    elsif arr[0] == 'row3'
      verify_row3
    else
      invalid_turn
    end
  end

  def verify_row1
    if @row1[@index] == ' '
      @row1[@index] = @player_symbol
      win_row1
    else invalid_turn
    end
  end

  def verify_row2
    if @row2[@index] == ' '
      @row2[@index] = @player_symbol
      win_row1
    else invalid_turn
    end
  end

  def verify_row3
    if @row3[@index] == ' '
      @row3[@index] = @player_symbol
      win_row1
    else invalid_turn
    end
  end

  def invalid_turn
    puts 'Invalid play, try again!'
    @player1 = !(@player1 == true)
    play_turn
  end

  def win_row1
    if row_equal?(@row1)
      announce_winner
    else win_row2
    end
  end

  def win_row2
    if row_equal?(@row2)
      announce_winner
    else win_row3
    end
  end

  def win_row3
    if row_equal?(@row3)
      announce_winner
    else win_col1
    end
  end

  def win_col1
    if col_or_diag_equal?(@row1[0], @row2[0], @row3[0])
      announce_winner
    else win_col2
    end
  end

  def win_col2
    if col_or_diag_equal?(@row1[1], @row2[1], @row3[1])
      announce_winner
    else win_col3
    end
  end

  def win_col3
    if col_or_diag_equal?(@row1[2], @row2[2], @row3[2])
      announce_winner
    else win_diag1
    end
  end

  def win_diag1
    if col_or_diag_equal?(@row1[0], @row2[1], @row3[2])
      announce_winner
    else win_diag2
    end
  end

  def win_diag2
    if col_or_diag_equal?(@row1[2], @row2[1], @row3[0])
      announce_winner
    else it_a_tie
    end
  end

  def it_a_tie
    if no_winner?(@row1, @row2, @row3)
      announce_no_winner
    else display_board
    end
  end

  def announce_winner
    @winner = true
    puts player_winner.to_s
    display_board
    exit
  end

  def player_winner
    if @player1 == true
      'Player 2 wins'
    else
      'Player 1 wins'
    end
  end

  def announce_no_winner
    puts "It's a tie"
    display_board
    exit
  end
end
