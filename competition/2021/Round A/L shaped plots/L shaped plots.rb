T = gets.to_i

T.times{|case_num|
  rc = gets.split(' ').map{|num| num.to_i}
  r = rc[0]
  c = rc[1]

  grid = []
  r.times{
    grid << gets.split(' ').map{|cell| cell.to_i}
  }

  answer = 0

  if r > 1 && c > 1
    grid.each_with_index{|row, i|
      width_right = 0
      width_left = 0

      row.each_with_index{|cell, j|
        height_down = 0
        height_up = 0

        unless cell == 1
          next
        else
          row[j..-1].each{|search_cell|
            if search_cell == 1
              width_right += 1
            else
              break
            end
          }

          row.reverse[(row.length - j)..-1].each{|search_cell|
            if search_cell == 1
              width_left += 1
            else
              break
            end
          }

          grid[i..-1].each{|search_row|
            if search_row[j] == 1
              height_down += 1
            else
              break
            end
          }

          grid.reverse[(grid.length - i)..-1].each{|search_row|
            if search_row[j] == 1
              height_up += 1
            else
              break
            end
          }

          for width in (2..width_right) do
            if height_down >= 2 * width || height_up >= 2 * width
              answer += 1
            end
          end

          for width in (2..width_left) do
            if height_down >= 2 * width || height_up >= 2 * width
              answer += 1
            end
          end

          for height in (2..height_down) do
            if width_right >= 2 * height || width_left >= 2 * height
              answer += 1
            end
          end

          for height in (2..height_up) do
            if width_right >= 2 * height || width_left >= 2 * height
              answer += 1
            end
          end
        end
      }
    }
  end

  puts "Case ##{case_num + 1}: #{answer}"
}
