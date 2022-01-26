module Enumerable
  # Your code goes here
  def my_each_with_index
    (0...size).each { |i|
      yield self[i], i
    }
    self
  end

  def my_select
    selected = []
    (0...size).each { |i|
      selected << self[i] if yield self[i]
    }
    selected
  end

  def my_all?
    answer = true
    (0...size).each { |i|
      answer = false unless yield self[i]
    }
    answer
  end

  def my_any?
    answer = false
    (0...size).each { |i|
      answer = true if yield self[i]
    }
    answer
  end

  def my_none?
    answer = true
    (0...size).each { |i|
      answer = false if yield self[i]
    }
    answer
  end

  def my_count
    return size unless block_given?
    count = 0
    (0...size).each { |i|
      count += 1 if yield self[i]
    }
    count
  end

  def my_map
    mapped_values = []
    (0...size).each { |i|
      new_val = yield self[i]
      mapped_values << new_val
    }
    mapped_values
  end

  def my_inject(total)
    (0...size).each { |i|
      total = yield total, self[i]
    }
    total
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    (0...size).each { |i|
      yield self[i]
    }
    self
  end
end
