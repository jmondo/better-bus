class StopsController < ApplicationController
  def nearest_stops
    lat = params[:lat].to_f.radians
    lng = params[:lng].to_f.radians
    if params[:lat] && params[:lng]
      stops = Stop.search(nil, :geo => [lat, lng], :order => "geodist ASC")
      render :json => stops
    else
      render :json => { :errors => 'lat and lng must both be specified in params string (in degrees)' }, :status => 422
    end
  end
end
