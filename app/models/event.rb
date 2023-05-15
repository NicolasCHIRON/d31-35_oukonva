class Event < ApplicationRecord
  has_many :attendances
  belongs_to :administrator, class_name: "User"

  validates :start_date, presence:true, comparison: { greater_than: : }
end
