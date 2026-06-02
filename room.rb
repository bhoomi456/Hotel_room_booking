class Room 
  @@room_number = 0

  attr_accessor :room_number, :room_type, :price_per_day, :available

  def initialize(room_type, price_per_day)
    @@room_number += 1
    @room_number = @@room_number
    @room_type = room_type
    @price_per_day = price_per_day
    @available = true
  end
end
