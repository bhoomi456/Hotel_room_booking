class Room 

  attr_accessor :room_number, :room_type, :price_per_day, :available

  def initialize(room_number, room_type, price_per_day)
    @room_number = room_number
    @room_type = room_type
    @price_per_day = price_per_day
    @available = true
  end
end

r = Room.new(101, "standard", 2000)
puts r.room_number
puts r.room_type
puts r.price_per_day
puts r.available