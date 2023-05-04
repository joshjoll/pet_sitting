class SittingRequest < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  
  validates :pickup, presence: true
  validates :drop_off, presence: true
  validates :animal_id, presence: true
  validates :pet_name, presence: true
  validates_associated :user
  validates_associated :animal
  validate :sitting_times

  before_create :set_request_status

  enum request_status: {
    'pending': 1,
    'accepted': 2,
    'rejected': 3,
    'cancelled': 4
  }

  # adding this method because I'm consistently typing both ways
  def dropoff
    self.drop_off
  end

private
  def set_request_status
    self.request_status = 1
  end

  def sitting_times
    return unless self.pickup.present? & self.drop_off.present?
    if self.pickup < self.drop_off
      self.errors.add("Pickup", " must be after dropoff")
    end
    if ((self.pickup - self.drop_off) / 60 / 60) > 8
      self.errors.add("Pickup", " must be no more than 8 hours after dropoff")
    end
  end
end
