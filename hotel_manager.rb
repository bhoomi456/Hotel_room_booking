module HotelManager
  def book_room(guest, room_type, no_of_days)
    room =  @rooms.find do |b|
      b.room_type == room_type && b.available == true
    end
    if room != nil
      add_booking(guest, room, no_of_days)
    else
      raise RoomNotAvailable, "Room not available"
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
  end
end