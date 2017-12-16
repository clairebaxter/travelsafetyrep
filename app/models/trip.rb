class Trip < ActiveRecord::Base
    has_and_belongs_to_many :passenger
    paginates_per 5
    #validates :passenger_name, presence: {message: "the trip needs a passenger name"},format: { with: /\A[a-zA-Z ]+\z/,
    #message: "only allows letters" }
    #validates :passenger_name, length: { in: 2..20}
    validates :timestamps, :presence => true
    validate :timestamps_cannot_be_in_the_past
    
    def timestamps_cannot_be_in_the_past
        if timestamps < Time.now-6.hours
            errors.add(:timestamps, "can't be in the past")
        end
    end

end