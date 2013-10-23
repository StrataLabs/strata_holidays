class Customer < ActiveRecord::Base
  has_many :cust_iti_headers
  has_many :wish_list_items
  belongs_to :user
  validates_presence_of :user_id
  validates_uniqueness_of :user_id

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

  def self.build(params)
    new(:name => params[:name], :user_id => params[:id],
      :email => params[:email])
  end
end
