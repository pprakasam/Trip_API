class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :update_user_item, :destroy]

  # GET /items
  def index
    @items = Item.all

    render json: @items
  end

  # show all items for a trip
  def showitems
    @items = Item.where('trip_id = ?', params[:id])

    render json: @items
  end

  # show all items assigned to a user
  def showmyitems
    @items = Item.where('assigned_to = ? AND trip_id = ?', params[:id], params[:tripId])

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH /items/trip_id/params_array
  def update_trip_items
    items = params[:itemsArray].split(',')
    @items = Item.where(conditions: { item_name: items, trip_id: params[:tripId] })
    if @items.update_all(update_items_assigned_to)
      render json: @items
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(update_items_assigned_to)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH
  # def update_user_item
  #   if @item.update(update_items_assigned_to)
  #     render json: @item
  #   else
  #     render json: @item.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:item_name, :assigned_to, :trip_id)
    end

    def update_items_assigned_to
      params.require(:item).permit(:assigned_to)
    end
end
