class ItiHeader < ActiveRecord::Base
  validates_presence_of :name, :iti_type, :vacation_type_id, :iti_start_date, :iti_end_date, :season, :duration, :no_of_people
  validates :name, length: {minimum:3, maximum: 80}
  validate :end_date_check

  def end_date_check
    unless iti_end_date.nil? || iti_start_date.nil?
      errors.add(:iti_end_date, "cannot be past start date") if iti_end_date < iti_start_date
    end
  end
end
