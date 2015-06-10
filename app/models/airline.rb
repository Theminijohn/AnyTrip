class Airline < ActiveRecord::Base
  has_one :trip
end
