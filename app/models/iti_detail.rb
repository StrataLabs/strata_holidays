class ItiDetail < ActiveRecord::Base
  belongs_to :iti_header
  belongs_to :destination
  belongs_to :property
end
