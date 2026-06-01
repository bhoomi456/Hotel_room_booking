require_relative "room"
require_relative "guest"
require_relative "hotel"

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
h.display_booking_details(g)