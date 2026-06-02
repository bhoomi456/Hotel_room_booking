class Booking 

  attr_accessor :guest, :room, :no_of_days, :status
  
  def initialize(guest, room, no_of_days)
    @room = room
    @guest = guest
    @no_of_days = no_of_days
    @status = "active"
  end
end