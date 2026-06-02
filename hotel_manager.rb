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

  def cancel_booking(guest)
    if @booked_rooms.find {|b| b.guest.guest_id == guest.guest_id && b.status == "active"} != nil
      @booked_rooms.each do |b|
        if b.guest.guest_id == guest.guest_id
          b.status = "cancelled"
          b.room.available = true
        end
      end
      puts "Booking cancelled successfully"
    else
      puts "No boooking found"
    end
  end

  def display_booking_details(guest)
    guest_booked_room = @booked_rooms.select {|b| b.guest.guest_id == guest.guest_id}

    if guest_booked_room.empty?
      puts "There is no Booking!"
    else
      puts "\n"
      puts "----Booking Details----"
      guest_booked_room.each do |b|
        puts "Guest Name : #{guest.name}"
        puts "Room number : #{b.room.room_number}"
        puts "Room Type : #{b.room.room_type}"
        puts "Price per day : #{b.room.price_per_day}"
        puts "No of days : #{b.no_of_days}"
        puts "Status : #{b.status}"
        puts "\n"
      end
    end
  end
end

