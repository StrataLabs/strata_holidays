class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy, :import_email_ids, :promotion_mail]
  before_filter :confirm_user_type_is_vc, except: :index
  before_filter :authenticate_admin_user, only: :index
  layout 'unwinders'
  # GET /campaigns
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  def create
    @campaign = Campaign.new(campaign_params)
    if params[:preview_button] || !@campaign.save!
      render :action => 'new', :layout => 'unwinders'
    else
      flash[:notice] = "Successfully created campaign."
      redirect_to campaign_path(@campaign)
    end
    # @campaign = Campaign.new(campaign_params)

    # if @campaign.save
    #   redirect_to @campaign, notice: 'Campaign was successfully created.'
    # else
    #   render action: 'new'
    # end
  end

  # PATCH/PUT /campaigns/1
  def update
    if @campaign.update(campaign_params)
      redirect_to @campaign, notice: 'Campaign was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /campaigns/1
  def destroy
    @campaign.destroy
    redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.'
  end

  def import_email_ids
    @include_image = false
    if params[:include_image]
      @include_image = true
    end
  end

  def promotion_mail
    if params[:choice] == 'Manual'
      to_ids = params[:to_ids].split(',').flatten!
    elsif params[:choice] == 'CSV'
      to_ids = []
      CSV.foreach(params[:file].path) do |row|
        to_ids << row[0]
      end
    end
    details = {}
    details[:to_ids] = to_ids
    details[:subject] = params[:subject]
    details[:include_image] = params[:include_image] if params[:include_image]
    details[:content] = params[:content]
    details[:id] = @campaign.id

    Delayed::Job.enqueue PromotionMailerJob.new(details)
    m = VcPromotionMailer.new
    m.subject = params[:subject]
    m.content = params[:content]
    m.vacation_consultant_id = current_user.vacation_consultant.id
    m.save
    redirect_to user_unwinders_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def campaign_params
      params.require(:campaign).permit(:name, :image, :vacation_consultant_id, :active)
    end
end
