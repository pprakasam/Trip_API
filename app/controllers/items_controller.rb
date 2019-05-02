class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :update_user_item]

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
    @items = Item.where('assigned_to = ? AND trip_id = ?', params[:userName], params[:tripId])

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    item_params[:items].each do |u|
      @item = Item.create(u)
    end
    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH /items/trip_id/params_array
  def update_trip_items
    myitems = params[:itemsArray].split(',')
    if Item.where(item_name: myitems, trip_id: params[:tripId]).update_all(assigned_to: params[:userName])
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

    # def set_item_for_destroy
    #   @destroy_item = current_user.items.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.except(:format).permit(items: [:item_name, :trip_id])
    end

    def update_items_assigned_to
      params.require(:item).permit(:assigned_to)
    end
end
