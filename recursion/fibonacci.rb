require 'pry'

def fib(n)
  sequence = [0, 1]
  n.times do
    sequence.push(sequence[-1] + sequence[-2])
  end
  puts sequence.to_s
end

def fib_rec(n, sequence=[0,1])
  n==2?sequence : fib_rec(n-1, sequence.push(sequence[-1] + sequence[-2]))
end

binding.pry