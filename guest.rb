class Guest 
  @@guest_id = 0

  attr_accessor :name, :guest_id
  
  def initialize(name)
    @@guest_id += 1
    @name = name
    @guest_id = @@guest_id
  end
end