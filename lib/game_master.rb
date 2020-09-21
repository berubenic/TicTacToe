# frozen_string_literal: true

# Gives players instructions and starts the game
class GameMaster
  def initialize; end

  def ask_start_game
    puts 'Do you want to play a game of Tic Tac Toe? (Yes or No) :)'
    play_a_game = gets.chomp
    if play_a_game == 'Yes'
      explain_rules
    elsif play_a_game == 'No'
      puts 'Bye!'
    else ask_start_game
    end
  end

  def explain_rules
    puts "\nLet me explain the rules.\n\nThe board has 3 rows each with 3 columns."
    puts "\n\n row1: col1, col2, col3\n row2: col1, col2, col3\n row3: col1, col2, col3\n\nFor this example, I am \"X\""
    puts "\nI answer \"row2 col2\""
    puts "\n\n [\" \",\" \",\" \"]\n [\" \",\"X\",\" \"]\n [\" \",\" \",\" \"]"
    puts "\n\nEach your turn you shall place your symbol."
    puts "\nFirst one to place 3 consecutive symbols wins.\nThey can be vertically, horizontally or diagonally aligned."
    understand_rules
  end

  def understand_rules
    puts 'Do you understand? (Yes or No)'
    understand_rules = gets.chomp
    explain_rules if understand_rules != 'Yes'
  end
end
