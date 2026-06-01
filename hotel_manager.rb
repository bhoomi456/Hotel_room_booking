require_relative "hotel"
require_relative  "guest"
require_relative "room"

module HotelManager

  def book_room(guest, room_type, no_of_days)
    room =  @rooms.find do |b|
      b.room_type == room_type && b.available == true
    end

    guest = @guests.find {|g| g.guest_id == guest.guest_id}
    
    if guest == nil
      raise GuestNotFound, "Guest not found"
    elsif room == nil
      raise RoomNotAvailable, "Room not available"
    elsif no_of_days <= 0
      raise InvalidNumberOfDays, "Invalid number of days Entered"
    else
      add_booking(guest, room, no_of_days)
    end
  end

  def add_booking(guest, room, no_of_days)
    booking = {
      room_number: room.room_number,
      room_type: room.room_type,
      price_per_day: room.price_per_day,
      no_of_days: no_of_days
    }
    guest.booked_rooms << booking
    puts "#{romm.room_number} Booked successfully"
  end
end

r = Room.new(1, "regular", 2000)
r2 = Room.new(2, "regular", 2000)

g = Guest.new("bhoomi", 101)
g2 = Guest.new("bhoomi", 102)

h = Hotel.new("taj")

h.add_rooms(r)
h.add_rooms(r2)
h.add_guests(g)
h.add_guests(g2)
h.book_room(g, "regular", 2)
