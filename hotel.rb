class Hotel 

  attr_accessor :name, :rooms, :guests
  def initialize(name)
    @name = name
    @rooms = []
    @guests = []
  end

  def find_room(room)
    @rooms.find {|r| r.room_number == room.room_number}
  end

  def find_guests(guest)
    @guests.find {|g| g.guest_id == guest.guest_id}
  end

  def add_rooms(room)
    if find_room(room) != nil
      puts "#{room.room_number} Room already exist"
    else
      @rooms << room
      puts "Room added successfully"
    end
  end

  def add_guests(guest)
    if find_guests(guest) != nil
      puts "#{guest.guest_id} Already registered"
    else
      @guests << guest
      puts "#{guest.name} guest added successfully"
    end
  end
end
