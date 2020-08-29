require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

Pry.start

upper_east = Listing.new("Upper East Side", "New York City")
chelsea = Listing.new("Chelsea", "London")
la = Listing.new("LA", "Los Angeles")
paris = Listing.new("Parisian Getaway", "Paris")

austin = Guest.new("Austin")
bex = Guest.new("Rebecca")

paris_trip = Trip.new(paris, austin)
paris_round2 = Trip.new(paris, bex)
la_trip = Trip.new(la, austin)

