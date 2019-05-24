class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise 'Out of bounds' unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false if self.include?(num)
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    # num.between?(0, @store.length - 1)
    num >= 0 && num <= @store.length - 1
  end

  def validate!(num)
  end
end










class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
      if include?(num)
        self[num].delete(num)
      end
  end

  def include?(num)
    self[num].include?(num)
  end
  
  private
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
