class Airline < ActiveRecord::Base
  extend FriendlyId
  friendly_id :airline_slug

  has_one :trip

  def select_name
  	"(#{iata}) #{name}"
  end

  def airline_slug
    "#{iata} #{name}"
  end
end
