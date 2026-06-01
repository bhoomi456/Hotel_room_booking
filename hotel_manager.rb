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
    room.available = false
    puts "#{room.room_number} Booked successfully"
  end
end

