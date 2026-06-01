class Room 

  attr_accessor :room_number, :room_type, :price_per_day, :available

  def initialize(room_number, room_type, price_per_day)
    @room_number = room_number
    @room_type = room_type
    @price_per_day = price_per_day
    @available = true
  end
end
