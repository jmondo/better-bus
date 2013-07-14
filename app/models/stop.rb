class Stop < ActiveRecord::Base
  def coordinates_in_radians
    [ lat * Math::PI / 180,
      lon * Math::PI / 180 ]
  end
end
