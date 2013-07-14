class RemoveStopId < ActiveRecord::Migration
  def up
    remove_column :stops, :stop_id
    remove_column :stops, :short_title
  end

  def down
    add_column :stops, :stop_id, :string
    add_column :stops, :short_title, :string
  end
end
