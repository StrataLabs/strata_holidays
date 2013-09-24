class StaticPagesController < ApplicationController
  layout "static_pages"
  include Commentable
  def itinerary
    @cust_iti_details = CustItiHeader.find(1).cust_iti_details
      # @cust_dest = {}
      # @cust_dest_poa = []
      # @cust_iti_header.cust_iti_details
      # @cust_iti_header.cust_iti_details.each do |det|
      #   @cust_dest[:stay_prop] = det.property
      #   @cust_dest[:poa_details] = det.iti_cust_dest_poa_details
      #   @cust_dest_poa << @cust_dest
      # end
      # @cust_dest_poa_det = @cust_dest_poa[0][:poa_details].group_by {|d| [d.day_number, d]}
  end

  def admin
    p @cust_iti_details = CustItiHeader.find(1).cust_iti_details
  end
end

