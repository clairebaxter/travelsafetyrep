# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

environment_seed_file = File.join(Rails.root, 'db', 'seeds', "#{Rails.env}.rb")

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/#{file_name}.png"))
end

more_lines = [
{:train => '1', :color => 'Red', :borough => 'Manhattan', :description => ' The one train is fairly old'},
{:train=>'2',:color =>'Red', :borough =>'Manhattan',:description =>'Same track as the 1 and 3'},
{:train=>'3',:color =>'Red', :borough =>'Manhattan',:description =>'Same track as the 1 and 2'},
{:train=>'4',:color =>'Green',:borough =>'Manhattan',:description =>'Express through the Bronx and Manhattan'},
{:train=>'5',:color =>'Green', :borough =>'Manhattan',:description => 'Clean express'},
{:train=>'6',:color =>'Green',:borough =>'Manhattan',:description => 'Not so clean local'},
{:train=>'7',:color =>'Purple',:borough =>'Queens',:description => 'Goes above ground'},
{:train=>'A',:color =>'Blue',:borough =>'Manhattan',:description => 'Clean and fairly new'},
{:train=>'C',:color =>'Blue',:borough =>'Manhattan',:description => 'Clean and fairly new'},
{:train=>'E',:color =>'Blue',:borough =>'Manhattan',:description => 'Clean and fairly new'},
{:train=>'B',:color =>'Orange', :borough =>'Brooklyn',:description => 'Old and worn out'},
{:train=>'D',:color =>'Orange',:borough =>'Brooklyn',:description => 'Old and worn out'},
{:train=>'F',:color =>'Orange',:borough =>'Brooklyn',:description => 'Old and worn out'},
{:train=>'M',:color =>'Orange',:borough =>'Brooklyn',:description => 'Old and worn out'},
{:train => 'L', :color => 'Gray', :borough => 'Manhattan', :description => 'The L train is fairly clean!'},
{:train => 'G', :color => 'Lime Green', :borough => 'Queens', :description => 'The G train is old.'}, 
{:train=>'J',:color =>'Brown',:borough =>'Brooklyn',:description => 'Old and worn out'},
{:train=>'Z',:color =>'Brown',:borough =>'Brooklyn',:description => 'Old and worn out'},
{:train=>'N',:color =>'Yellow',:borough =>'Brooklyn',:description => 'Fairly clean express'},
{:train => 'Q',:color => 'Yellow',:borough => 'Manhattan',:description => 'The new 2nd ave line!'}, 
{:train=>'R',:color =>'Yellow',:borough =>'Manhattan',:description => 'Old and worn out'},
{:train=>'W',:color =>'Yellow',:borough =>'Brooklyn',:description => 'What used to be the Q line'}]

#might use this later for image path, currently not working
#:image => '/app/assets/images/Ltrain1.png'

more_lines.each do |line|
   Line.create!(line)
end

#.where("train= 'L'") 
more_lines.each do |attributes|
  attributes[:image] = seed_image('Ltrain1')
  #Line.find_or_create_by(attributes[:train])
end

trips = Trip.create([{:train => 'A', :passenger_name => 'Test'}])