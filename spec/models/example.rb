class Example
  attr_accessor :name,:id
  def initialize(name,id)
    @name=name
    @id=id
  end

  def ==(other)
    self.name=other.name && self.id=other.id
  end
end