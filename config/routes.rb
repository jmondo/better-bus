BetterBus::Application.routes.draw do
  get 'stops/nearest' => 'stops#nearest_stops'
end
