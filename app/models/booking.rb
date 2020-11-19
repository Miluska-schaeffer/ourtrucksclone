class Booking < ApplicationRecord
  validates_presence_of :start_date, :end_date
  validate :end_date_is_after_start_date

  belongs_to :user
  belongs_to :truck

  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

   if end_date < start_date
    errors.add(:end_date, "cannot be before the start date")
  end
end
end

# validates :status, :start_date, :end_date, presence: true
