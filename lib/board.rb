# frozen_string_literal: true

# Create and update board
class Board
  def initialize
    @row1 = []
    @row2 = []
    @row3 = []
    @col1 = ' '
    @col2 = ' '
    @col3 = ' '
    create_board
  end

  def create_board
    @row1.push(@col1, @col2, @col3)
    @row2.push(@col1, @col2, @col3)
    @row3.push(@col1, @col2, @col3)
  end
end
