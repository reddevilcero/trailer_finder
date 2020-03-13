ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'



# Type `rake -T` on your command line to see the available rake tasks.

task :console do 
    Pry.start 
end 

task :parked_trailers do # 0.28237005
    start = Time.now

    100.times do
        depot = Depot.order('RANDOM()').first
        depot.parked_trailers
    end
    puts (Time.now - start)/100
end

task :alt_trailers do # 0.20640154
    start = Time.now

    100.times do
        depot = Depot.order('RANDOM()').first
        depot.alt_trailers
    end
    puts (Time.now - start)/100
end

task :sql do # 0.030426405
    start = Time.now

    1000.times do
        depot = Depot.order('RANDOM()').first
        depot.sql
    end
    puts (Time.now - start)/1000
end

task :much_better do # 0.020126525
    start = Time.now

    1000.times do
        depot = Depot.order('RANDOM()').first
        depot.much_better
    end
    puts (Time.now - start)/1000
end

task :sql_arel do # 0.019590283
    start = Time.now

    1000.times do
        depot = Depot.order('RANDOM()').first
        depot.sql_arel
    end
    puts (Time.now - start)/1000
end

task :sql_better do # 0.013527716
    start = Time.now

    1000.times do
        depot = Depot.order('RANDOM()').first
        depot.sql_better
    end
    puts (Time.now - start)/1000
end

task :current_trailers do # .000235105
    start = Time.now

    1000.times do
        depot = Depot.order('RANDOM()').first
        depot.current_trailers
    end
    puts (Time.now - start)/1000
end