module Fetcher
	class AirportFetcher < Base

		attr_reader, :departure_airport, :arrival_airport, :trip

		def post_initialize(args)
      @trip         = args[:trip]
      @departure_fs = args[:departure_airport]
      @arrival_fs   = args[:arrival_airport]
    end

    def perform
    	begin
        # Compute Distance
				# departure_airport = FlightStats::Airport.current f.departure_airport_fs_code
				# arrival_airport 	= FlightStats::Airport.current f.arrival_airport_fs_code

				# distance = Geocoder::Calculations.distance_between(
					# [departure_airport.latitude, departure_airport.longitude],
					# [arrival_airport.latitude, arrival_airport.longitude],
					# {units: :km}
				# )
    	rescue StandardError => e
    		# raise FetchError, "We couldn't fetch you Flight Details! Please contact TMJ"
        raise FetchError, e
    	end
    end

    private

	end
end
