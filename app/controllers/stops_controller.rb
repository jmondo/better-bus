class StopsController < ApplicationController
  NEAREST_DISTANCE = 0.10
  def nearest_stops
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    if params[:lat] && params[:lng]
      stops = Stop.near([lat, lng], NEAREST_DISTANCE)
      render :json => stops
    else
      render :json => { :errors => 'lat and lng must both be specified in params string (in degrees)' }, :status => 422
    end
  end
end
