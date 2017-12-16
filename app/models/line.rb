class Line < ActiveRecord::Base
    
    paginates_per 5
    
    validates :train, presence: {message: "Please name the train."}
    validates :description, presence: {message: "Please write a description."}
    validates :description, length: { in: 5..100}
    
    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
end