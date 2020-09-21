# frozen_string_literal: true

# Chooses player symbol and keeps track of their turns
class Player
  attr_reader :symbol, :player
  def initialize(player)
    @symbol = nil
    @player = player
  end

  def choose_player1_symbol
    puts "#{@player}, do you want \"X\" or \"O\"?\nEnter \"X\" or \"O\"."
    @symbol = gets.chomp
    verify_valid_symbol
  end

  def choose_player2_symbol(player1_symbol)
    @symbol = if player1_symbol == 'X'
                'O'
              else
                'X'
              end
    display_player_symbols(player1_symbol)
  end

  def display_player_symbols(player1_symbol)
    puts "Player 1 is #{player1_symbol} and Player 2 is #{@symbol}.\n "
  end

  def verify_valid_symbol
    unless @symbol != 'X' || @symbol != 'O'
      puts 'Invalid Input, try again!'
      choose_player1_symbol
    end
  end
end
