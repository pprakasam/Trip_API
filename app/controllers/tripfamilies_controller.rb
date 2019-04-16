class TripfamiliesController < ProtectedController
  before_action :set_tripfamily, only: [:show, :update, :destroy]

  # GET /tripfamilies
  def index
    @tripfamilies = current_user.tripfamilies.all

    render json: @tripfamilies
  end

  # GET /tripfamilies/1
  def show
    render json: @tripfamily
  end

  # POST /tripfamilies
  def create
    @tripfamily = current_user.tripfamilies.build(tripfamily_params)

    if @tripfamily.save
      render json: @tripfamily, status: :created, location: @tripfamily
    else
      render json: @tripfamily.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tripfamilies/1
  def update
    if @tripfamily.update(tripfamily_params)
      render json: @tripfamily
    else
      render json: @tripfamily.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tripfamilies/1
  def destroy
    @tripfamily.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tripfamily
      @tripfamily = current_user.tripfamilies.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tripfamily_params
      params.require(:tripfamily).permit(:family, :trip_id, :user_id, :place)
    end
end
