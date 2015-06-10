class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :airline
  has_many :flight_details, dependent: :destroy
end
