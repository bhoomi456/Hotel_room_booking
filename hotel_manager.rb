module HotelManager
  
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

  def calculate_bill(guest)
    price = guest.booked_rooms[:price_per_day]
    no_of_days = guest.booked_rooms[:no_of_days].to_i
    price * no_of_days
  end

  def find_booking(guest, room_number)
    guest.booked_rooms.find{ |h| h[:room_number] == room_number}
  end

  def cancel_booking(guest, room_number)
    if find_booking(guest, room_number) != nil
      room = find_room(room_number)
      guest.booked_rooms.reject! {|booking| booking[:room_number] == room_number}  
      room.available = true
      puts "#{room_number} Cancelled successfully"
    else
      puts "#{room_number} has no booking with #{guest.guest_id}"
    end
  end

  

end

