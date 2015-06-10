require 'flightstats'

FlightStats.app_id = Settings.flightstats.app_id
FlightStats.app_key = Settings.flightstats.app_key

FlightStats.logger = Rails.logger
