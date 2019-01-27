def bubble_sort(values)
  swapped = true
  while swapped do
    swapped = false
    values.each_with_index.map do |item, idx|      
      if !values[idx+1].nil? && item>values[idx+1]
        values[idx], values[idx+1] = values[idx+1], values[idx]
        swapped = true
      end
    end
  end  
  return values
end

def bubble_sort_by(values)
  swapped = true
  while swapped do
    swapped = false
    values.each_with_index.map do |item, idx|
      if !values[idx+1].nil? && yield(item, values[idx+1])>0
        values[idx], values[idx+1] = values[idx+1], values[idx]
        swapped = true
      end
    end
  end
  return values
end

bubble_sort_by(["hi","hello","hey"]) do |left, right|
  left.length - right.length
end