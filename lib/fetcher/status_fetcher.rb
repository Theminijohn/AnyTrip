module Fetcher
	class StatusFetcher < Base

		attr_reader :trip_id, :iata, :flight_number, :year, :month, :day

		def post_initialize(args)
			@trip  = args[:trip]
    end

    def perform
    	begin
				create_flight_details(flight_statistics)
    	rescue StandardError
    		raise FetchError, "We couldn't fetch you Flight Details! Please contact TMJ"
    	end
    end

    private

    def create_flight_details(flights)
    	flights.each do |f|
				@trip.flight_details.create(
					arrival_airport_fs_code:        f.arrival_airport_fs_code,
					arrival_date_local:             f.arrival_date.date_local,
					arrival_date_utc:               f.arrival_date.date_utc,
					departure_airport_fs_code:      f.departure_airport_fs_code,
					departure_date_local:           f.departure_date.date_local,
					departure_date_utc:             f.departure_date.date_utc,
					flight_duration:                f.flight_durations.scheduled_block_minutes,
					flight_id:                      f.flight_id,
					flight_number:                  f.flight_number,
					scheduled_gate_arrival_local:   f.operational_times.scheduled_gate_arrival.date_local,
					scheduled_gate_arrival_utc:     f.operational_times.scheduled_gate_arrival.date_utc,
					scheduled_gate_departure_local: f.operational_times.scheduled_gate_departure.date_local,
					scheduled_gate_departure_utc:   f.operational_times.scheduled_gate_departure.date_utc,
					status:                         f.status,
					trip_id:                        @trip_id
				)
			end
    end

	end
end