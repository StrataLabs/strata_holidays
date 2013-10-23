class WishListItemsController < ApplicationController
  before_action :set_wish_list_item, only: [:show, :edit, :update, :destroy]
  layout 'unwinders'

  # GET /wish_list_items
  def index
    @wish_list_items = WishListItem.all
  end

  # GET /wish_list_items/1
  def show
  end

  # GET /wish_list_items/new
  def new
    @wish_list_item = WishListItem.new
  end

  # GET /wish_list_items/1/edit
  def edit
  end

  # POST /wish_list_items
  def create
    @wish_list_item = WishListItem.new(wish_list_item_params)
    respond_to do |format|
      if @wish_list_item.save
        format.html { redirect_to @wish_list_item, notice: 'Wish list item was successfully created.' }
        format.js
      else
        format.html { render action: 'new'}
        format.js
      end
    end
  end

  # PATCH/PUT /wish_list_items/1
  def update
    if @wish_list_item.update(wish_list_item_params)
      redirect_to @wish_list_item, notice: 'Wish list item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /wish_list_items/1
  def destroy
    @wish_list_item.destroy
    render :partial => 'layouts/requests_cart'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish_list_item
      @wish_list_item = WishListItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wish_list_item_params
      params.permit(:destination_id, :customer_id)
    end
end
