require 'pry'

def beer(n)
  if n == 0
    puts "No more beers on the wall"
  else
    puts "#{n} beers on the wall"
    beer(n-1)
  end
end

binding.pry