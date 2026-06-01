require_relative "room"
require_relative "guest"
require_relative "hotel"

r = Room.new(1, "regular", 2000)

g = Guest.new("bhoomi", 101)

h = Hotel.new("taj")

h.add_rooms(r)