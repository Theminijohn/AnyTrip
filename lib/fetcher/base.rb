module Fetcher
	class	Base

		attr_reader :trip, :iata, :flight_number, :year, :month, :day

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
      rescue StandardError => e
        raise FetchError, e
      end
    end

	protected

		def flight_statistics
			@flights ||= FlightStats::FlightStatus.departing_on @iata ,@flight_number, @year, @month, @day
		end

	end
end
