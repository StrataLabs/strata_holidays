class Customer < ActiveRecord::Base
  has_many :cust_iti_headers
  belongs_to :user
  include PgSearch
  multisearchable :against => [:name]
  pg_search_scope :search_by_name, :against => :name
  searchable do
    text :name, :boost => 2.0
    text :email
  end

  def self.search_me(query)
    Customer.search do
      fulltext query
    end
  end
end
