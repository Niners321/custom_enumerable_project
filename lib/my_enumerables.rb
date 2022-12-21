module Enumerable
  def my_each
  end

  def my_each_with_index
  end

  def my_all
  end

  def my_any
  end
  
  def my_count
  end

  def my_inject
  end

  def my_map
  end
  
  def my_none
  end

  def my_select
  end

  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    return self unless block_given?
    i = 0
    while i < length
      yield self[i]
      i += 1
    end
  end

  def my_each_with_index
    return self unless block_given?
    if self.is_a?(Array)
      self.size.times {|index| yield self[index],index}
      self
    end
  end

  def my_all?
    result = []
    self.my_each {|x| result << x if yield(x)}
    result == self
  end

  def my_any
    result = []
    self.my_each {|x| return yield(x)}
  end
  
  def my_count
    return self.length unless block_given?
    result = []
    self.my_each {|x| result << x if yield(x)}
    return result.length
  
  end

  #Still need to work on
  def my_inject(i = nil)
    result = self[i]
    while i < length - 1
        result = yield(result, self[i + 1])
        i += 1
    end
    return result
  end


  def my_map
    result = []
    self.my_each {|x| result << yield(x)}
    return result
  end
  
  def my_none?
    result = []
    self.my_each {|x| return yield(x) ? false : true}
  end

  def my_select
    result = []
    self.my_each {|x| result << x if yield(x)}
    return result
  end
end
