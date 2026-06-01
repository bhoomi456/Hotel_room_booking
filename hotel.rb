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
      @rooms << room
      puts "Room added successfully"
    else
      puts "#{room.room_number} Room already exist"
    end
  end

  def add_guests(guest)
    if find_guests(guest) != nil
      @guests << guest
      puts "#{guest.name} guest added successfully"
    else
      puts "#{guest.guest_id} Already registered"
    end
  end
end
