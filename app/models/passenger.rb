class Passenger < ActiveRecord::Base
    has_and_belongs_to_many :trip
    
    def self.create_with_omniauth(auth)
        Passenger.create!(
          :provider => auth["provider"],
          :uid => auth["uid"],
          :name => auth["info"]["name"],
          :email => auth["info"]["email"],
          
         
          :gender => auth["info"]["gender"])
          #:picture => auth["info"]["picture"])
          #:age_range => auth["info"]["age_range"])
          #user.avatar = auth.info.image 
          #passenger.image = auth.info.image
          
    end
    
    
    
    
    def fetch_fb_picture
        
           image_tag "http://graph.facebook.com/#{passenger_name}/picture"
        
    end
    
    
    def user_params
      params.require(:passenger).permit(:picture)
      params.require(:passenger).permit(:birthday)
    end
    def normalimage
        "http://graph.facebook.com/#{self.uid}/picture?type=large"
    end
    
    
end