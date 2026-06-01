class Guest 

  attr_accessor :name, :guest_id, :booked_rooms
  def initialize(name, guest_id)
    @name = name
    @guest_id = guest_id
    @booked_rooms = []
  end
end

g = Guest.new("bhoomi", 101)
puts g.name
puts g.guest_id