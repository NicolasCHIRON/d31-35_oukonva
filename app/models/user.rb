class User < ApplicationRecord
  has_many :attendances, foreign_key: 'attendee_id', class_name: "Attendance"
  has_many :events, foreign_key: 'administrator_id', class_name: "Event"

  def attendee?
    attendances.count > 0
  end

  def administrator?
    events.count > 0
  end
  
end
