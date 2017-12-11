class Passenger < ActiveRecord::Base
    has_many :trip
    
    def self.create_with_omniauth(auth)
        Passenger.create!(
          :provider => auth["provider"],
          :uid => auth["uid"],
          :name => auth["info"]["name"])
    end
end
