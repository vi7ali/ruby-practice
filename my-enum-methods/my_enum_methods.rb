module Enumerable
  def my_each
    i=0
    while i<self.length
      yield(self[i])
      i+=1
    end
    return self
  end

  def my_each_with_index
    i=0
    while i<self.length
      yield(self[i], i)
      i+=1
    end
    return self
  end

  def my_select
    result = []
    self.my_each {|n| result.push(n) if yield(n)}   
    result
  end

  def my_all?
    check=true
    self.my_each {|n| check=false unless yield(n)}
    check
  end

  def my_any?
    check=false
    self.my_each {|n| check=true if yield(n)}
    check
  end

  def my_none?
    check=true
    self.my_each {|n| check=false if yield(n)}
    check
  end

  def my_map(&block)
    b = []
    self.my_each {|n| b.push(block.call(n))}
    b
  end
end