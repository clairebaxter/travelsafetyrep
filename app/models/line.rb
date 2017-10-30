class Line < ActiveRecord::Base
    #def self.all_colors ; %w['Blue', 'Brown', 'Gray', 'Green', 'Light Green', 'Orange', 'Yellow', 'Purple', 'Red'] ; end #  shortcut: array of strings
        #validates :train, :presence => true
        #validates :borough, :presence => true
        #validate :released_1930_or_later # uses custom validator below
        #validates :color, :inclusion => {:in => Line.all_colors},
        #:unless => :grandfathered?
    #end
    #def released_1930_or_later
        #errors.add(:release_date, 'must be 1930 or later') if
      #release_date && release_date < Date.parse('1 Jan 1930')
    #end
    #@@grandfathered_date = Date.parse('1 Nov 1968')
    #def grandfathered?
        #release_date && release_date < @@grandfathered_date
    #end
end
# try in console:
#m = Line.new(:train => '', :color => 'RG', :release_date => '1929-01-01')
# force validation checks to be performed:
#m.valid?  # => false
#m.errors[:train] # => ["can't be blank"]
#m.errors[:color] # => [] - validation skipped for grandfathered movies
#m.errors[:borough] # => ["must be 1930 or later"]
#m.errors.full_messages # => ["Title can't be blank", "Rating is not included in the list", "Release date must be 1930 or later"]
#end