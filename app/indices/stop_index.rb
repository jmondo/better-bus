# app/indices/article_index.rb
ThinkingSphinx::Index.define :stop, :with => :active_record do
  indexes 'title'
  has "RADIANS(lat)",  :as => :lat,  :type => :float
  has "RADIANS(lon)",  :as => :lng,  :type => :float
  group_by 'lat', 'lon'
end