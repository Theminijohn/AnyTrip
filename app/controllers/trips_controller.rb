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
    @trip.flight_number = @trip.flight_number.gsub!(/\D/, "")

    year  = @trip.departure_date.year
    month = @trip.departure_date.month
    day   = @trip.departure_date.day

    flights = FlightStats::FlightStatus.departing_on @trip.airline.iata ,@trip.flight_number, year, month, day

    # @trip.flight_id = flight.first.flight_id

    flights.each do |flight|
      FlightDetail.create(
        arrival_airport_fs_code:        flight.arrival_airport_fs_code,
        arrival_date_local:             flight.arrival_date.date_local,
        arrival_date_utc:               flight.arrival_date.date_utc,
        departure_airport_fs_code:      flight.departure_airport_fs_code,
        departure_date_local:           flight.departure_date.date_local,
        departure_date_utc:             flight.departure_date.date_utc,
        flight_duration:                flight.flight_durations.scheduled_block_minutes,
        flight_id:                      flight.flight_id,
        flight_number:                  flight.flight_number,
        scheduled_gate_arrival_local:   flight.operational_times.scheduled_gate_arrival.date_local,
        scheduled_gate_arrival_utc:     flight.operational_times.scheduled_gate_arrival.date_utc,
        scheduled_gate_departure_local: flight.operational_times.scheduled_gate_departure.date_local,
        scheduled_gate_departure_utc:   flight.operational_times.scheduled_gate_departure.date_utc,
        status:                         flight.status
      )
    end

    if @trip.save
      redirect_to @trip, notice: 'Your trip was successfully created.'
    else
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
