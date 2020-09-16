require_relative 'verify_win'
# frozen_string_literal: true

# Create board and check winner
class Game
  include VerifyWin

  def initialize(row1, row2, row3, player1_symbol, player2_symbol)
    @row1 = row1
    @row2 = row2
    @row3 = row3
    @player1_symbol = player1_symbol
    @player2_symbol = player2_symbol
    @player1 = true
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
    if @player1 == true
      puts 'Player 1, where do you want to play?'
      player_move = gets.chomp
      @player1 = false
      symbol_placement(player_move, @player1_symbol)
    else
      puts 'Player 2, where do you want to play?'
      player_move = gets.chomp
      @player1 = true
      symbol_placement(player_move, @player2_symbol)
    end
  end

  def symbol_placement(player_move, player_symbol)
    case player_move
    when 'row1 col1'
      if @row1[0] == ' '
        @row1[0] = player_symbol
        verify_if_win
      else invalid_turn
      end
    when 'row1 col2'
      if @row1[1] == ' '
        @row1[1] = player_symbol
        verify_if_win
      else invalid_turn
      end
    when 'row1 col3'
      if @row1[2] == ' '
        @row1[2] = player_symbol
        verify_if_win
      else invalid_turn
      end
    when 'row2 col1'
      if @row2[0] == ' '
        @row2[0] = player_symbol
        verify_if_win
      else invalid_turn
      end
    when 'row2 col2'
      if @row2[1] == ' '
        @row2[1] = player_symbol
        verify_if_win
      else invalid_turn
      end
    when 'row2 col3'
      if @row2[2] == ' '
        @row2[2] = player_symbol
        verify_if_win
      else invalid_turn
      end
    when 'row3 col1'
      if @row3[0] == ' '
        @row3[0] = player_symbol
        verify_if_win
      else invalid_turn
      end
    when 'row3 col2'
      if @row3[1] == ' '
        @row3[1] = player_symbol
        verify_if_win
      else invalid_turn
      end
    when 'row3 col3'
      if @row3[2] == ' '
        @row3[2] = player_symbol
        verify_if_win
      else invalid_turn
      end
    else
      invalid_turn
    end
  end

  def invalid_turn
    puts 'Invalid play, try again!'
    @player1 = !(@player1 == true)
    play_turn
  end

  def verify_if_win
    if row_equal?(@row1)
      announce_winner
    elsif row_equal?(@row2)
      announce_winner
    elsif row_equal?(@row3)
      announce_winner
    elsif col_or_diag_equal?(@row1[0], @row2[0], @row3[0])
      announce_winner
    elsif col_or_diag_equal?(@row1[1], @row2[1], @row3[1])
      announce_winner
    elsif col_or_diag_equal?(@row1[2], @row2[2], @row3[2])
      announce_winner
    elsif col_or_diag_equal?(@row1[0], @row2[1], @row3[2])
      announce_winner
    elsif col_or_diag_equal?(@row1[2], @row2[1], @row3[0])
      announce_winner
    elsif no_winner?(@row1, @row2, @row3)
      announce_no_winner
    else display_board
    end
  end

  def announce_winner
    @winner = true
    if @player1 == true
      puts 'Player 2 wins!'
    else
      puts 'Player 1 wins!'
    end
    display_board
    exit
  end

  def announce_no_winner
    puts "It's a tie"
    display_board
    exit
  end
end
