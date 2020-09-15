# frozen_string_literal: true

# Create board and check winner
class Game
  def initialize
    row1 = [' ', ' ', ' ']
    row2 = [' ', ' ', ' ']
    row3 = [' ', ' ', ' ']
    create_board(row1, row2, row3)
  end

  def create_board(row1, row2, row3)
    p row1
    p row2
    p row3
  end
end
