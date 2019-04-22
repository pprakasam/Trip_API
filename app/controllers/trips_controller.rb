class TripsController < ProtectedController
  before_action :set_trip, only: [:update, :destroy]

  # GET /trips
  def index
    @trips = Trip.all

    render json: @trips
  end

  # GET /trips/1
  def show
    @trip = Trip.find(params[:id])
    render json: @trip
  end

  # POST /trips
  def create
    @trip = current_user.trips.build(trip_params)

    if @trip.save
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = current_user.trips.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trip_params
      params.require(:trip).permit(:place, :street, :city, :state, :zip,
                                   :from_date, :to_date, :families_joining,
                                   :user_id)
    end
end
