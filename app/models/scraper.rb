require 'rest_client'

class Scraper
  BASE_URL = 'http://webservices.nextbus.com/service/publicXMLFeed'
  include ActiveModel::Serializers::Xml

  def replace_all_stops
    Stop.delete_all
    all_muni_routes.each do |route|
      Stop.create(stops_for_route(route))
    end
    nil
  end

  private

  def get_and_parse_xml_with_params(params)
    response = RestClient.get(BASE_URL, params: params)
    response = Hash.from_xml(response)
  end

  def all_muni_routes
    response = get_and_parse_xml_with_params(command: 'routeList', a: 'sf-muni')
    response['body']['route']
  end

  def stops_for_route(route)
    response = get_and_parse_xml_with_params(command: 'routeConfig', a: 'sf-muni', r: route['tag'])
    response['body']['route']['stop'].map{|x| x.slice('tag', 'title', 'lat', 'lon').merge('route_tag' => route['tag']) }
  end
end
