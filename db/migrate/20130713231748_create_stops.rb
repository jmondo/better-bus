class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :tag
      t.string :title
      t.string :short_title
      t.float :lat
      t.float :lon
      t.string :stop_id

      t.timestamps
    end
  end
end
