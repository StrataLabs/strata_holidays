class HomeController < ApplicationController
  layout "unwinders"
  before_filter :authenticate_user!, :except => 'index'
  def index
    @cust_iti_request = CustItiRequest.new
  end
end
