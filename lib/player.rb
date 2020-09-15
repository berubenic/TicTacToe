# frozen_string_literal: true

# Chooses player symbol and keeps track of their turns
class Player
  def initialize
    puts "Player 1, do you want \"X\" or \"O\"?\nEnter \"X\" or \"O\"."
    player1_symbol = gets.chomp
    player_symbols(player1_symbol)
  end

  def player_symbols(player1_symbol)
    if player1_symbol == 'X'
      player2_symbol = 'O'
      puts "Player 1 is \"X\" and Player 2 is \"O\".\n "
      Game.new([], [], [], player1_symbol, player2_symbol)
    elsif player_1_symbol == 'O'
      player2_symbol = 'X'
      puts "Player 1 is \"O\" and player 2 is \"X\".\n "
      Game.new([], [], [], player1_symbol, player2_symbol)
    else initialize
    end
  end
end
