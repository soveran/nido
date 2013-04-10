class Nido < String
  def initialize(key)
    super(key.to_s)
  end

  def [](key)
    self.class.new("#{self}:#{key}")
  end
end
