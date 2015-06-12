class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :airline
  has_many :flight_details, dependent: :destroy

  def flight_distance
  	flight_details.inject(0) { |sum, e| sum + e.flight_distance }
  end

  def create_flight_details(data)
  	data.each do |d|
  		flight_details.create(
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
				trip_id:                        id
			)
  	end
  end

end


# Get Airports
# Fetcher::AirportFetcher.new(
#   departure_airport: f.departure_airport_fs_code,
#   arrival_airport: f.arrival_airport_fs_code
# ).fetch