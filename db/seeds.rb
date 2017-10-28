# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

more_lines = [{:train => 'Q',  :color => 'Yellow', :borough => 'Manhattan', :description => 'The new 2nd ave line!'}, {:train => 'L', :color => 'Gray', :borough => 'Manhattan', :description => 'The L train is fairly clean!'},
{:train => 'G', :color => 'Green', :borough => 'Queens', :description => 'The G train is old.'}]

more_lines.each do |line|
   Line.create!(line)
end
