class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = current_user.trips.new
  end

  def edit
  end

  def create
    @trip = current_user.trips.new(trip_params)
    @trip.flight_number = @trip.flight_number.gsub(/\D/, "")

    begin
      status_data = Fetcher::StatusFetcher.new(trip: @trip).fetch
      binding.pry
    rescue Fetcher::FetchError, ActiveRecord::RecordInvalid => e
      error_message = e.message || "We couldn't verify that Flight, Please Contact TMJ."
      flash[:notice] = error_message
      render :new
    end

  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: 'Trip was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_url, notice: 'Trip was successfully destroyed.'
  end

  private
    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:departure_date, :flight_number, :status, :user_id, :airline_id)
    end
end
