class HomeController < ApplicationController
  layout "unwinders"
  before_filter :authenticate_user!, :except => 'index'
  def index
    vcs = VacationConsultant.all
    @vcs = vcs.sort_by{rand}[0..2]
    @cust_iti_request = CustItiRequest.new
  end
end
