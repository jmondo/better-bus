desc 'seed/replace bus stops'
task :replace_stop_data => :environment do
  Scraper.new.replace_all_stops
  Rake::Task["ts:rebuild"].invoke
end
