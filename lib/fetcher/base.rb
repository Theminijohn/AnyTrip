module Fetcher
	class	Base

		attr_reader 

		def initialize(args)
			@trip = args[:trip]
			@iata = @trip.airline.iata
			@flight_number = @trip.flight_number
			@year  = @trip.departure_date.year
			@month = @trip.departure_date.month
			@day   = @trip.departure_date.day
			post_initialize(args)
		end

		def post_initialize(args)
			nil
		end

		def perform
			raise NotImplementedError
		end

		def fetch
      begin
        perform
      rescue StandardError
        raise FetchError, "Try again later we couldn't connect to the API"
      end
    end

	protected

		def flight_statistics
			@flights = FlightStats::FlightStatus.departing_on @iata ,@flight_number, @year, @month, @day
			binding.pry
		end

	end
end