class Event < ApplicationRecord
  has_many :attendances
  has_many :attendees, class_name: "User", through: :attendances
  belongs_to :administrator, class_name: "User"

  validates :start_date, presence:true, comparison: { greater_than: :Date.today }
  validates :duration, presence:true, numericality: {greater_than : 0}
  validate :duration_is_multiple_of_5
  validates :title, presence:true, length: {in: 5..140}
  validates :description, presence:true, lenght: {in: 20..1000}
  validates :price, presence:true, numericality: {in: 1..1000}
  validates :location, presence:true

  def duration_is_multiple_of_5
    if duration %5 != 0
      errors.add(:duration, "La durée de l'évènement doit être un multiple de 5.")
    end
  end

end