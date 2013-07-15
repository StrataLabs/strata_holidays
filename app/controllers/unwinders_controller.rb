class UnwindersController < ApplicationController
  layout "unwinders"
  def index
    @body_id = "list"
    dest = DestItiDetail.group(:dest_iti_header_id)
                        .select(:dest_iti_header_id, 'count(dest_iti_header_id) as count')
                        .collect{|result| {:dest_iti_header_id => result.dest_iti_header_id, :count => result.count}}
    @dest_headers = dest.sort_by{|d| d[:count]}.reverse!.first(4)
    render :layout => 'unwinders'
  end

  def child
    @body_id = "transaction"
  end

  def home
    @body_id = "home"
  end

  #FIXME All this has to be moved to respective controllers once devise is ready
  def user
    @body_id = "list"
    @cust_iti_request = CustItiRequest.new(params[:cust_iti_request])
    render :layout => 'unwinders'
  end

  def vacation_consultant
    if params[:id].present?
      @vc = VacationConsultant.find(params[:id])
      @vc_assignments = @vc.vc_assignments
      render :layout => 'unwinders'
    else
    end
  end
end
