class Airline < ActiveRecord::Base
  has_one :trip

  def select_name
  	"(#{iata}) #{name}"
  end
end
