# frozen_string_literal: true

# Chooses player symbol and keeps track of their turns
class Player
  def initialize
    create_player1
    @player1_symbol = nil
    @player2_symbol = nil
  end

  def create_player1
    Player1.new
  end

  def create_player2
    Player2.new
  end
end

class Player1 < Player
  def initialize
    @symbol = nil
    create_player1_symbol
  end

  def create_player1_symbol
    puts "Player 1, do you want \"X\" or \"O\"?\nEnter \"X\" or \"O\"."
    @symbol = gets.chomp
    Player2.new
  end
end

class Player2 < Player1
  attr_reader :symbol
  def initialize
    @symbol = nil
    player_symbols
  end

  def player_symbols
    if Player1.symbol == 'X'
      @symbol = 'O'
      puts "Player 1 is \"X\" and Player 2 is \"O\".\n "
      Game.new(@player1_symbol, @player2_symbol)
    elsif @player1_symbol == 'O'
      @player2_symbol = 'X'
      puts "Player 1 is \"O\" and player 2 is \"X\".\n "
      Game.new(@player1_symbol, @player2_symbol)
    else Player.new
    end
  end
end
