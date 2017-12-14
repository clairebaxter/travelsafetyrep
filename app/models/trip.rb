class Trip < ActiveRecord::Base
    has_and_belongs_to_many :passenger
    paginates_per 5
   # validates :bikeid, :presence => true, :format => {:with => /\w\d\d\d\d/, :message => "the format has to be similar to A0000"}
    #validates :serialnumber, :presence => true, :numericality => {:only_integer => false, :message => "must be a number"}
    #validates :condition, :presence => true, :format => {:with => /\w*/, :message => "the condition field can only include letters"}
    validates :passenger_name, presence: {message: "the trip needs a passenger name"},format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :passenger_name, length: { in: 2..20}
    
    
end