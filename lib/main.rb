# frozen_string_literal: true

require_relative 'game_master'
require_relative 'player'
require_relative 'game'
# Boots up the game
boot_game = GameMaster.new
boot_game.ask_start_game

player1 = Player.new('Player 1')
player1.choose_player1_symbol

player2 = Player.new('Player 2')
player2.choose_player2_symbol(player1.symbol)

start_game = Game.new(player1.symbol, player2.symbol)
start_game.create_board
