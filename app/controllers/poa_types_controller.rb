class PoaTypesController < ApplicationController
  before_action :set_poa_type, only: [:show, :edit, :update, :destroy]

  # GET /poa_types
  # GET /poa_types.json
  def index
    @poa_types = PoaType.paginate(:page => params[:page])
  end

  # GET /poa_types/1
  # GET /poa_types/1.json
  def show
  end

  # GET /poa_types/new
  def new
    @poa_type = PoaType.new
  end

  # GET /poa_types/1/edit
  def edit
  end

  # POST /poa_types
  # POST /poa_types.json
  def create
    @poa_type = PoaType.new(poa_type_params)

    respond_to do |format|
      if @poa_type.save
        format.html { redirect_to @poa_type, notice: 'Poa type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @poa_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @poa_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poa_types/1
  # PATCH/PUT /poa_types/1.json
  def update
    respond_to do |format|
      if @poa_type.update(poa_type_params)
        format.html { redirect_to @poa_type, notice: 'Poa type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @poa_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poa_types/1
  # DELETE /poa_types/1.json
  def destroy
    @poa_type.destroy
    respond_to do |format|
      format.html { redirect_to poa_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poa_type
      @poa_type = PoaType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poa_type_params
      params.require(:poa_type).permit(:description, :time_can_be_spent, :comments)
    end
end
