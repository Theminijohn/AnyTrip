class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :airline
  has_many :flight_details, dependent: :destroy

  def flight_distance
  	flight_details.inject(0) { |sum, e| sum + e.flight_distance }
  end

end
