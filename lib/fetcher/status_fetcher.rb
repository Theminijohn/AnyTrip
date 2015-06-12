module Fetcher
	class StatusFetcher < Base

		attr_reader :trip, :iata, :flight_number, :year, :month, :day

    FlightDetail = Struct.new(
			:arrival_airport_fs_code, :departure_airport_fs_code, :arrival_date_local, :arrival_date_utc,
			:carrier_fs_code, :departure_date_local, :departure_date_utc, :scheduled_block_minutes,
			:scheduled_equipment_iata_code, :flight_id, :flight_number, :published_local_arrival, :published_utc_arrival,
			:published_departure_local, :published_departure_utc, :scheduled_gate_arrival_local, :scheduled_gate_arrival_utc,
			:scheduled_gate_departure_local, :scheduled_gate_departure_utc, :flight_type, :service_classes, :status
		)

		def post_initialize(args)
			@trip  = args[:trip]
			@iata  = @trip.airline.iata
			@day   = @trip.departure_date.day
			@year  = @trip.departure_date.year
			@month = @trip.departure_date.month
			@flight_number = @trip.flight_number
    end

    def perform
    	begin
				create_flight_details(flights.first)
    	rescue StandardError
    		raise FetchError, "We couldn't fetch you Flight Details! Please contact TMJ"
    	end
    end

	private

  	def create_flight_details(flight)
			FlightDetail.new(
				flight.arrival_airport_fs_code,
				flight.departure_airport_fs_code,
				flight.arrival_date.date_local,
				flight.arrival_date.date_utc,

				flight.carrier_fs_code,
				flight.departure_date.date_local,
				flight.departure_date.date_utc,
				flight.flight_durations.scheduled_block_minutes,

				flight.flight_equipment.scheduled_equipment_iata_code,
				flight.flight_id,
				flight.flight_number,

				flight.operational_times.published_arrival.date_local,
				flight.operational_times.published_arrival.date_utc,
				flight.operational_times.published_departure.date_local,
				flight.operational_times.published_departure.date_utc,
				flight.operational_times.scheduled_gate_arrival.date_local,
				flight.operational_times.scheduled_gate_arrival.date_utc,
				flight.operational_times.scheduled_gate_departure.date_local,
				flight.operational_times.scheduled_gate_departure.date_utc,

				flight.schedule.flight_type,
				flight.schedule.service_classes,
				flight.status
			)
    end

    protected

    def flights
    	@flights ||= FlightStats::FlightStatus.departing_on @iata ,@flight_number, @year, @month, @day
    end

	end
end
