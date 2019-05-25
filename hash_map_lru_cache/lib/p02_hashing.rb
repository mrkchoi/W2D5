class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.map(&:to_s).map(&:ord).join('').to_i
  end
end

class String
  def hash
    self.map(&:to_s).map(&:ord).join('').to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
  end
end

# a = [1,2,3]
# a = a.map(&:to_s).map(&:ord).join('').to_i