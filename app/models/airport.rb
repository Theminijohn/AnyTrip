class Airport < ActiveRecord::Base
  has_and_belongs_to_many :trips

  extend FriendlyId
  friendly_id :airport_slug

  def airport_slug
    "#{iata} #{city}"
  end

end
