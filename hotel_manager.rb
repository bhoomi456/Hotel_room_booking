module HotelManager
  
  def book_room(guest, room_type, no_of_days)
    room =  @rooms.find do |b|
      b.room_type == room_type && b.available
    end

    if guest == nil
      raise GuestNotFound, "Guest not found"
    elsif room == nil
      raise RoomNotAvailable, "Room not available"
    elsif no_of_days <= 0
      raise InvalidNumberOfDays, "Invalid number of days Entered"
    else
      booking = Booking.new(guest, room, no_of_days)
      @booked_rooms << booking
      room.available = false
      puts "Room booked successfully"
    end
  end

  def calculate_bill(guest)
    total_amount = 0
    @booked_rooms.each do |b|
      if b.guest.guest_id == guest.guest_id && b.status == "closed"
        price_per_day = b.room.price_per_day
        no_of_days = b.no_of_days
        total_amount += price_per_day * no_of_days
      end
    end
    total_amount
  end

  def cancel_booking(guest, room)
    if find_booking(guest, room.room_number) != nil
      guest.booked_rooms.reject! {|booking| booking[:room_number] == room.room_number}  
      room.available = true
      puts "#{room.room_number} Cancelled successfully by #{guest.name}"
      # puts guest.booked_rooms.length
    else
      puts "Room number : #{room.room_number} has no booking with #{guest.name}-#{guest.guest_id}"
    end
  end

  def display_booking_details(guest)
    if guest.booked_rooms.length >= 1
      puts "----Booking Details----"
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

