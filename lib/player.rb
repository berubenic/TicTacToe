# frozen_string_literal: true

# Chooses player symbol and keeps track of their turns
class Player
  def initialize
    puts "Player 1, do you want \"X\" or \"O\"?\nEnter \"X\" or \"O\"."
    @player_1_symbol = gets.chomp
    if @player_1_symbol == 'X'
      @player_2_symbol = 'O'
      puts 'Player 1 is "X" and Player 2 is "O".'
    elsif @player_1_symbol == 'O'
      @player_2_symbol = 'X'
      puts 'Player 1 is "O" and player 2 is "X".'
    else initialize
    end
  end
end
