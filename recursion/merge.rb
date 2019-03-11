def merge_sort(list)
  if list.length <= 1
    return list
  else    
    left = merge_sort(list[0...list.length/2])        
    right = merge_sort(list[list.length/2..-1])    
    sorted = []
    while !left.empty? && !right.empty?
      if left[0] <= right[0]
        sorted.push(left[0])
        left.slice!(0)
      else
        sorted.push(right[0])
        right.slice!(0)
      end
    end    
  end
  sorted + left + right
end