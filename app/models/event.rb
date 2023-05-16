class Event < ApplicationRecord
  has_many :attendances
  has_many :attendees, class_name: "User", through: :attendances
  belongs_to :administrator, class_name: "User"

  validate :start_date_cannot_be_in_the_past
  validates :duration, presence:true, numericality: {greater_than: 0}
  validate :duration_is_multiple_of_5
  validates :title, presence:true, length: {in: 5..140}
  validates :description, presence:true, length: {in: 20..1000}
  validates :price, presence:true, numericality: {in: 1..1000}
  validates :location, presence:true

  def duration_is_multiple_of_5
    if duration.present? && duration % 5 != 0
      errors.add(:duration, "La durée de l'évènement doit être un multiple de 5.")
    end
  end

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "La date de début ne peut pas être dans le passé.") if
      !start_date.blank? and start_date < Date.today
  end

  def end_date
    return (start_date + duration * 60)
  end

end