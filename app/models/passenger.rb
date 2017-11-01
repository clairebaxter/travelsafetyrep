class Passenger < ActiveRecord::Base
  
  devise :omniauthable, :omniauth_providers => [:facebook]
  
  def self.create_with_omniauth(auth)
    Passenger.create!(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"])
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |passenger|
      passenger.email = auth.info.email
      passenger.password = Devise.friendly_token[0,20]
      passenger.name = auth.info.name   # assuming the user model has a name
      passenger.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |passenger|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        passenger.email = data["email"] if passenger.email.blank?
      end
    end
  end
  
end