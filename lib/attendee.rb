class Attendee
  
  attr_reader :name, :budget

  def initialize(attendee_hash)
    @name = attendee_hash[:name]
    @budget = attendee_hash[:budget]
  end
end