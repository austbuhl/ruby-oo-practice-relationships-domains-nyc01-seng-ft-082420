
# Listing ===> Trip <=== Guest

class Listing

    attr_accessor :listing, :city
    @@all = []

    def initialize(listing, city)
        @listing = listing
        @city = city
        @@all << self
    end

    def self.all
        @@all
    end

    def trips
        Trip.all.filter { |trip| trip.listing == self}
    end

    def guests
        trips.map { |trip| trip.guest}
    end
    
    def self.find_all_by_city(city)
        self.all.filter { |listings| listings.city == city}
    end

    ## need to count the listings to find the number of trips and return max
    def self.most_popular
            self.all.max { |listings| listings.trips.count}
    end
end

class Trip

    attr_accessor :listing, :guest
    @@all = []

    def initialize(listing, guest)
        @listing = listing
        @guest = guest
        @@all << self
    end

    def self.all
        @@all
    end

end

class Guest

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def trips
        Trip.all.filter { |trip| trip.guest == self }
    end

    def listings
        trips.map { |trip| trip.listing }
    end


    def trip_count
        trips.count
    end

    def self.pro_traveller
        self.all.map do |guests|
            if guests.trip_count > 0
                guests.name
            end
        end
    end

    def self.find_all_by_name(name)
        self.all.filter { |guests| guests.name == name}
    end

end


### TESTING ####

# upper_east = Listing.new("Upper East Side", "New York City")
# chelsea = Listing.new("Chelsea", "London")
# la = Listing.new("LA", "Los Angeles")
# paris = Listing.new("Parisian Getaway", "Paris")

# austin = Guest.new("Austin")
# bex = Guest.new("Rebecca")

# paris_trip = Trip.new(paris, austin)
# paris_round2 = Trip.new(paris, bex)
# la_trip = Trip.new(la, austin)

