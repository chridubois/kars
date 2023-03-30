class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :starts_at, :ends_at, presence: true
end
