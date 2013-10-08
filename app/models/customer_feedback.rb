class CustomerFeedback < ActiveRecord::Base
  belongs_to :cust_iti_detail
  validates_presence_of :cust_iti_detail_id
  def self.build(params)
    new(:positive_comments => params[:positive_comments], :negative_comments => params[:negative_comments],
      :suggestions => params[:suggestions])
  end
end
