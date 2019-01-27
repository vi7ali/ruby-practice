def alphabetize(books, rev=false)
  if !rev
    books.sort { |first, second| first <=> second}    
  else
    books.sort { |first, second| second <=> first}
  end
end

books = ["Heart of Darkness", "Code Complete", "The Lorax", "The Prophet", "Absalom, Absalom!"]

puts "A-Z: #{alphabetize(books)}"
puts "Z-A: #{alphabetize(books, true)}"