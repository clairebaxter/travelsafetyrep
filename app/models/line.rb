class Line < ActiveRecord::Base
    ltrain = Line.create!(:train => 'L', :color => 'Gray', :borough => 'Manhattan', :description => 'The L train is fairly clean!')
    gtrain = Line.create!(:train => 'G', :color => 'Green', :borough => 'Queens', :description => 'The G train is old.')
    validates_uniqueness_of :train
end