class Stop < ActiveRecord::Base
  geocoded_by :title,
              latitude: :lat, longitude: :lon
end
