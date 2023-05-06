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

  before_create :set_request_status_to_pending_confirmation

  enum request_status: {
    'pending confirmation': 1,
    'pending acceptance': 2,
    'accepted': 3,
    'rejected': 4,
    'cancelled': 5
  }

  # adding this method because I'm consistently typing both ways
  def dropoff
    self.drop_off
  end

  def more_than_two_hours?
    ((self.pickup - self.drop_off) / 60 / 60) > 2
  end

  def less_than_eight_hours?
    ((self.pickup - self.drop_off) / 60 / 60) <= 8
  end

  def chronologically_correct?
    self.pickup > self.drop_off
  end

  def in_the_future?
    self.drop_off > DateTime.now
  end

private
  def set_request_status_to_pending_confirmation
    self.request_status = 1
  end

  def sitting_times
    return unless self.pickup.present? & self.drop_off.present?
    unless self.in_the_future?
      self.errors.add("Drop Off", " must be a date in the future")
    end
    unless self.chronologically_correct?
      self.errors.add("Pickup", " must be after dropoff")
    end
    unless self.less_than_eight_hours?
      self.errors.add("Pickup", " must be no more than 8 hours after dropoff")
    end
    unless more_than_two_hours?
      self.errors.add("Pickup", " must be atleast 2 hours after dropoff")
    end
  end
end
