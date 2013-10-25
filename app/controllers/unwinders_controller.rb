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
    type = current_user.user_type
    if type == User::CUSTOMER
      @current_user_requests = CustItiRequest.where(:customer_id => current_user.customer.id).order('created_at Desc').paginate(:per_page => 2, :page => params[:page] || 1)
      vcs = VacationConsultant.all
      @vcs = vcs.sort_by{rand}[0..3]
      @cust_iti_request = CustItiRequest.new
    elsif type == User::VC
      @vc = VacationConsultant.find_by_user_id(current_user.id)
      @vc_assignments = @vc.vc_assignments
    else
    end
    @body_id = "list"
    respond_to do |format|
      format.js
      format.html { render :layout => 'unwinders' }
    end
  end

  def vacation_consultant
    @body_id = "list"
    # dest = DestItiDetail.group(:dest_iti_header_id)
    #                     .select(:dest_iti_header_id, 'count(dest_iti_header_id) as count')
    #                     .collect{|result| {:dest_iti_header_id => result.dest_iti_header_id, :count => result.count}}
    # @dest_headers = dest.sort_by{|d| d[:count]}.reverse!.first(4)
    if params[:id].present?
      @vc = VacationConsultant.find(1)
      # @vc_assignments = @vc.vc_assignments
      render :layout => 'unwinders'
    else
    end
  end
end
