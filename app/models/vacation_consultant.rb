class VacationConsultant < ActiveRecord::Base
  has_many :consultant_customer_destinations
  searchable do
    text :name, :boost => 2.0
    text :email
    text :destinations do
      consultant_customer_destinations.map do |hsh|
        hsh.cust_iti_header.cust_iti_details.map do |h|
          h.destination.name rescue ''
        end
      end
    end
    text :poa do
      consultant_customer_destinations.map do |hsh|
        hsh.cust_iti_header.cust_iti_details.map do |h|
          h.destination.points_of_attractions.map {|poa| poa.name rescue ''}
        end
      end
    end
  end

  def self.search_me(query)
    VacationConsultant.search do
      fulltext query
    end
  end
end
