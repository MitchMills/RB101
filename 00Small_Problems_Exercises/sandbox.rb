def minSubLength(num_arr, min_sum)
  if num_arr.sum < min_sum
    return 0
  elsif num_arr.max >= min_sum
    return 1
  end

  chunk_size = 2
  loop do
    start_index = 0
    loop do
      if num_arr[start_index, chunk_size].sum >= min_sum
        return chunk_size
      else
        start_index += 1
      end
      break if start_index > (num_arr.size - chunk_size)
    end
    chunk_size += 1
    return 0 if chunk_size >= num_arr.size
  end
end

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0
