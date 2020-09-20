# frozen_string_literal: true

# Checks if turn is a win
module VerifyWin
  def row_equal?(arr)
    arr.each do |x|
      return false if x == ' '
    end
    (0..(arr.size - 2)).each do |i|
      return false if arr[i] != arr[i + 1]
    end
    true
  end

  def col_or_diag_equal?(row1, row2, row3)
    arr = []
    arr.push(row1, row2, row3)
    arr.each do |x|
      return false if x == ' '
    end
    (0..(arr.size - 2)).each do |i|
      return false if arr[i] != arr[i + 1]
    end
    true
  end

  def no_winner?(row1, row2, row3)
    arr = row1 + row2 + row3
    return true if arr.include?(' ') == false

    false
  end
end
