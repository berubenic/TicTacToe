class GameMaster
  def initialize
    puts 'Do you want to play a game of Tic Tac Toe? (Yes or No) :)'
    play_a_game = gets.chomp
    if play_a_game == 'Yes'
      explain_rules
    elsif play_a_game == 'No'
      puts 'Bye!'
    else
      initialize
    end
  end

  def explain_rules; end
end
