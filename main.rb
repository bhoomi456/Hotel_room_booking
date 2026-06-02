require_relative "room"
require_relative "guest"
require_relative "booking"
require_relative "hotel"

r = Room.new("regular", 2000)
r2 = Room.new("regular", 2000)
r3 = Room.new("premium", 4500)
r4 = Room.new("premium", 4500)

g = Guest.new("bhoomi")
g2 = Guest.new("venkatesh")
g3 = Guest.new("Guest1")

h = Hotel.new("taj")

h.add_rooms(r)
puts "------------------------------"
h.add_rooms(r2)
puts "------------------------------"
h.add_rooms(r3)
puts "------------------------------"
h.add_rooms(r4)
puts "------------------------------"


h.add_guests(g)
puts "------------------------------"

h.add_guests(g2)
puts "------------------------------"

h.add_guests(g3)
puts "-------------------------------"

h.book_room(g,"regular", 3)
# h.book_room(103, "regular", 1) # it raises error guest not found
# h.book_room(101, "regular", 0)  # it raises error Invalid days
# h.book_room(101, "regular", 2) # it raises error Room not available
puts "------------------------------"

h.book_room(g2, "premium", 4)

h.book_room(g3, "premium", 2)

h.display_booking_details(g)
puts "------------------------------"

h.cancel_booking(g)
puts "------------------------------"

h.display_booking_details(g)
puts "------------------------------"

h.checkout(g2)
puts "-------------------------------"

h.display_booking_details(g2)
puts "--------------------------------"

h.display_all_booking_details
puts "---------------------------------"