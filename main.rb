require_relative "room"
require_relative "guest"
require_relative "hotel"

r = Room.new(1, "regular", 2000)
r2 = Room.new(2, "regular", 2000)

g = Guest.new("bhoomi", 101)
g2 = Guest.new("bhoomi", 102)

h = Hotel.new("taj")

h.add_rooms(r)
puts "------------------------------"
h.add_rooms(r2)
puts "------------------------------"

h.add_guests(g)
puts "------------------------------"

h.add_guests(g2)
puts "------------------------------"

h.book_room(g, "regular", 1)
# h.book_room(g, "regular", 1)  # it raises error Invalid days
# h.book_room(g2, "regular", 2) # it raises error Room not available
puts "------------------------------"

h.display_booking_details(g)
puts "------------------------------"

h.cancel_booking(g, r)
puts "------------------------------"

h.display_booking_details(g)
puts "------------------------------"
