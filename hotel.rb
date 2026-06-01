class Hotel 

  attr_accessor :name, :rooms, :guests
  def initialize(name)
    @name = name
    @rooms = []
    @guests = []
  end

  def add_rooms(room)
    @rooms << room
    puts "Room added successfully"
  end

  def add_guests(guest)
    @guests << guest
    puts "#{guest.name} guest added successfully"
  end
end
