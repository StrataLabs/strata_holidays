class Customer < ActiveRecord::Base
  has_many :cust_iti_headers
  include PgSearch
  multisearchable :against => [:name]
  pg_search_scope :search_by_name, :against => :name
  searchable do
    text :name, :boost => 2.0
    text :email
    text :destinations do
      cust_iti_headers.map { |hdr| hdr.destination.name }
    end
  end

  def self.search_me(query)
    Customer.search do
      fulltext query
    end
  end
end
