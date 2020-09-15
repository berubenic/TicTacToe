require 'pry'
# frozen_string_literal: true

# Create board and check winner
class Game
  def initialize(row1, row2, row3, player1_symbol, player2_symbol)
    @row1 = row1
    @row2 = row2
    @row3 = row3
    @player1_symbol = player1_symbol
    @player2_symbol = player2_symbol
    @player1 = true
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
    play_turn
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
      if @row[2] == ' '
        @row[2] = player_symbol
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
    if all_equal?(@row1) == true
      puts "\nYou Win!!!\n"
    elsif all_equal?(@row2) == true
      puts "\nYou Win!!!\n"
    elsif all_equal?(@row3) == true
      puts "\nYou Win!!!\n"
    # elsif (@row1[0] == @row2[0]) && (@row2[0] == @row3[0])
    #   puts "\nYou Win!!!\n"
    # elsif @row1[1] == @row2[1] && @row2[1] == @row3[1]
    #   puts "\nYou Win!!!\n"
    else
      display_board
    end
  end

  def all_equal?(arr)
    (0..(arr.size - 2)).each do |i|
      return false if arr[i] != arr[i + 1]
    end
    true
  end
end
