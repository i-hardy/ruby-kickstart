# Write a method, spiral_access, that takes a 2d square array (an array of arrays)
# and a block, and calls the block for each of the elements, in spiral order.
#
# HINT: This method is probably best sovled recursively
#
# Example:
# two_d = [
#   [ 1,  2,  3,  4, 5],
#   [16, 17, 18, 19, 6],
#   [15, 24, 25, 20, 7],
#   [14, 23, 22, 21, 8],
#   [13, 12, 11, 10, 9],
# ]
# order = []
# spiral_access two_d do |i|
#   order << i
# end
# order # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]

def spiral_access(two_d, count = 0, &block)
  height = two_d.length - 1
  width = two_d.first.length - 1

  return if height/2 < count || width/2 < count

  (count..(width - count)).each do |x|
    block.call two_d[count][x]
  end

  ((count + 1)..(height-count)).each do |y|
    block.call two_d[y][width - count]
  end

  (width - 1 - count).downto count do |x|
    block.call two_d[height - count][x]
  end

  (height - 1 - count).downto count+1 do |y|
    block.call two_d[y][count]
  end

  spiral_access two_d, count+1, &block

end
