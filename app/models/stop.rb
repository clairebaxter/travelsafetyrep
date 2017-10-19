class Stop < ActiveRecord::Base
    ltrainstop1 = Stop.create!(:stop => '8 Avenue/14 Street')
    ltrainstop2 = Stop.create!(:stop => '6 Avenue/14 Street')
    ltrainstop3 = Stop.create!(:stop => '14 Street/Union Square')
    ltrainstop4 = Stop.create!(:stop => '3 Avenue/14 Street')
    ltrainstop5 = Stop.create!(:stop => '1 Avenue/14 Street')
end