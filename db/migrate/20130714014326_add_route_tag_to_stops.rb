class AddRouteTagToStops < ActiveRecord::Migration
  def change
    add_column :stops, :route_tag, :string
  end
end
