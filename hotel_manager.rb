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
    total_amount = 0
    guest.booked_rooms.each do |booking|
      price = booking[:price_per_day].to_f
      no_of_days = booking[:no_of_days].to_i
      total_amount += no_of_days * price
    end
    return total_amount
  end

  def find_booking(guest, room_number)
    guest.booked_rooms.find{ |h| h[:room_number] == room_number}
  end

  def cancel_booking(guest, room)
    if find_booking(guest, room.room_number) != nil
      guest.booked_rooms.reject! {|booking| booking[:room_number] == room.room_number}  
      room.available = true
      puts "#{room.room_number} Cancelled successfully by #{guest.name}"
      puts guest.booked_rooms.length
    else
      puts "Room number : #{room.room_number} has no booking with #{guest.name}-#{guest.guest_id}"
    end
  end

  def display_booking_details(guest)
    if guest.booked_rooms.length >= 1
      guest.booked_rooms.each do |b|
        puts "Guest Name : #{guest.name}"
        puts "Room number : #{b[:room_number]}"
        puts "Room Type : #{b[:room_type]}"
        puts "Price per day : #{b[:price_per_day]}"
        puts "No of days : #{b[:no_of_days]}"
        puts "Total amount : #{calculate_bill(guest)}"
      end
    else
      puts "There is no Booking!"
    end
  end
end

