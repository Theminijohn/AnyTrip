class AirportsController < ApplicationController
  def index
    @airports = Airport.all
  end

  def show
    @airport = Airport.find(params[:id])
    @hash = Gmaps4rails.build_markers(@airport) do |airport, marker|
      marker.lat airport.latitude
      marker.lng airport.longitude
      marker.picture({
        :url => "http://icons.iconarchive.com/icons/pelfusion/long-shadow-media/32/Maps-Pin-Place-icon.png",
        :width   => 32,
        :height  => 32
      })
      marker.infowindow   "i'm the title"
    end
  end
end

# // to center on a marker
# handler.map.centerOn(markers[0]); 
# // to set the map zoom
# handler.getMap().setZoom(16);


# // to center the map AND adjust zoom to see ALL markers
# handler.bounds.extendWith(markers);
# handler.fitMapToBounds();