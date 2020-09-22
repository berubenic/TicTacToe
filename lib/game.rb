# frozen_string_literal: true

require 'pry'
require_relative 'verify_win'
# Create board and check winner
class Game
  include VerifyWin

  POSSIBLE_ROWS = %w[row1 row2 row3].freeze
  def initialize(player1_symbol, player2_symbol)
    @row1 = []
    @row2 = []
    @row3 = []
    @rows = [@row1, @row2, @row3]
    @player1_symbol = player1_symbol
    @player2_symbol = player2_symbol
    @player_symbol = nil
    @player1 = true
    @player_move = nil
    @winner = false
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
    find_move_index
    row_valid?
  end

  def input_player_turn
    puts "#{player}, where do you want to play?"
    @player_move = gets.chomp
  end

  def player
    if @player1 == true
      'Player 1'
    else
      'Player 2'
    end
  end

  def switch_player_turn
    @player1 = !(@player1 == true)
  end

  def assign_player_symbol
    @player_symbol = if @player1 == true
                       @player2_symbol
                     else
                       @player1_symbol
                     end
  end

  def find_move_index
    @col_index = @player_move[-1].to_i - 1
    @row_index = @player_move[3].to_i - 1
    @row = @rows[@row_index]
  end

  def row_valid?
    arr = @player_move.split
    if POSSIBLE_ROWS.include?(arr[0])
      verify_rows
    else invalid_turn
    end
  end

  def verify_rows
    if @row[@col_index] == ' '
      @row[@col_index] = @player_symbol
      win_rows
    else invalid_turn
    end
  end

  def invalid_turn
    puts 'Invalid play, try again!'
    @player1 = !(@player1 == true)
    play_turn
  end

  def win_rows
    @rows.each do |row|
      if row_equal?(row)
        announce_winner
      else win_columns
      end
    end
  end

  def win_columns
    (0..3).each do |col|
      if col_or_diag_equal?(@row1[col], @row2[col], @row3[col])
        announce_winner
      else win_diag1
      end
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
