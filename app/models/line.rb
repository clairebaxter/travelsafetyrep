class Line < ActiveRecord::Base
    ltrain = Line.create!(:train => 'L', :color => 'Gray', :borough => 'Manhattan')
end