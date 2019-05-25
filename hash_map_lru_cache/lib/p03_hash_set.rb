class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      self[key] << key
      @count += 1
    end
    resize! if num_buckets - 1 == @count 
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num_buckets = num_buckets*2
    new_store = Array.new(new_num_buckets) {[]}
    @store.each do |bucket|
      bucket.each do |ele|
        new_store[ele.hash % new_num_buckets] << ele
      end
    end
    @store = new_store
  end
end
