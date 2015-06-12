module Fetcher
	class AirportFetcher < Base

		attr_reader :airport_iata

    Airport = Struct.new(
      :city, :city_code, :classification, :country_code, :country_name, :delay_index_url,
      :elevation_feet, :faa, :fs, :iata, :icao, :latitude, :longitude, :name, :postal_code,
      :region_name, :state_code, :time_zone_region_name, :utc_offset_hours, :weather_url,
      :weather_zone
    )

		def post_initialize(args)
      @airport_iata = args[:airport_iata]
    end

    def perform
    	begin
        create_airport(current_airport.first)
        # Compute Distance
				# departure_airport = FlightStats::Airport.current f.departure_airport_fs_code
				# arrival_airport 	= FlightStats::Airport.current f.arrival_airport_fs_code

				# distance = Geocoder::Calculations.distance_between(
					# [departure_airport.latitude, departure_airport.longitude],
					# [arrival_airport.latitude, arrival_airport.longitude],
					# {units: :km}
				# )
    	rescue StandardError => e
    		# raise FetchError, "We couldn't fetch the Airport Information! Please contact TMJ"
        raise FetchError, e
    	end
    end

  private

    def create_airport(a)
      # binding.pry
      Airport.new(
        a.city, 
        a.city_code, 
        a.classification, 
        a.country_code, 
        a.country_name, 
        a.delay_index_url,     
        a.elevation_feet, 
        a.faa, 
        a.fs, 
        a.iata, 
        a.icao, 
        a.latitude, 
        a.longitude, 
        a.name, 
        a.postal_code, 
        a.region_name, 
        a.state_code, 
        a.time_zone_region_name, 
        a.utc_offset_hours, 
        a.weather_url, 
        a.weather_zone
      )
    end

    protected

    def current_airport
      @airport ||= FlightStats::Airport.by_iata_code @airport_iata
    end

	end
end



