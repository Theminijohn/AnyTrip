class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :airline
  has_and_belongs_to_many :airports
  has_many :flight_details, dependent: :destroy

  extend FriendlyId
  friendly_id :random_slug

  def flight_distance
  	flight_details.inject(0) { |sum, e| sum + e.flight_distance }
  end

  def random_slug
    SecureRandom.hex(3)
  end
end
