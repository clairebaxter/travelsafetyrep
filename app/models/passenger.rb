class Passenger < ActiveRecord::Base
    has_many :trip
    
    def self.create_with_omniauth(auth)
        Passenger.create!(
          :provider => auth["provider"],
          :uid => auth["uid"],
          :name => auth["info"]["name"],
          :picture => auth["info"]["picture"])
          #user.avatar = auth.info.image 
         # passenger.image = auth.info.image
    end
    
    def fetch_fb_picture
        
           image_tag "http://graph.facebook.com/#{passenger_name}/picture"
        
        end
    def normalimage
        "http://graph.facebook.com/#{self.uid}/picture?type=large"
    end
    
end