class ItiHeader < ActiveRecord::Base
  belongs_to :vacation_type
  has_many :iti_details
  validates_presence_of :name, :iti_type, :vacation_type_id, :iti_start_date, :iti_end_date, :season, :duration, :no_of_people
  validates :name, length: {minimum:3, maximum: 80}
  validate :end_date_check
  after_create :create_iti_details

  ITI_TYPE = ['None', 'Simple', 'Regular', 'Complex', 'Very Complex']

  def end_date_check
    unless iti_end_date.nil? || iti_start_date.nil?
      errors.add(:iti_end_date, "cannot be past start date") if iti_end_date < iti_start_date
    end
  end

  def create_iti_details
    no_of_days = (iti_end_date - iti_start_date).to_i
    if no_of_days == 0
      iti_details = ItiDetail.new
      iti_details.day_number = 1
      iti_details.iti_header = self
      iti_details.iti_date = iti_start_date
      iti_details.save(:validate => false)
    else
      (0..no_of_days-1).each do |day|
        iti_details = ItiDetail.new
        iti_details.day_number = day + 1
        iti_details.iti_header = self
        iti_details.iti_date = iti_start_date + day.days
        iti_details.save(:validate => false)
      end
    end
  end
end
