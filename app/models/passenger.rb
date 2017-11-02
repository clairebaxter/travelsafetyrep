class Passenger < ActiveRecord::Base
    def self.create_with_omniauth(auth)
        Passenger.create!(
          :provider => auth["provider"],
          :uid => auth["uid"],
          :name => author["info"]["name"])
    end
end
