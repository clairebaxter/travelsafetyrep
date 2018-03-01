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
{:train=>'2',:color =>'Red', :borough =>'Manhattan',:description =>'The 2 Seventh Avenue Express is a rapid transit service in the A Division of the New York City Subway. Its route emblem, or "bullet", is colored red since it uses the IRT Broadway–Seventh Avenue Line through most of Manhattan.

The 2 operates at all times. Weekday service operates between 241st Street in Wakefield, Bronx and Flatbush Avenue–Brooklyn College in Flatbush, Brooklyn; limited rush hour service originates and terminates at New Lots Avenue in East New York, Brooklyn instead of Flatbush Avenue. Daytime service operates local in the Bronx and Brooklyn and express in Manhattan (between 96th and Chambers Streets); late night service operates local along its entire route.
Weekend service (from 11:45 p.m. Friday evening to 5 a.m. Monday morning) operates between Dyre Avenue in Eastchester, Bronx and South Ferry in Lower Manhattan. Daytime service operates local in the Bronx and in Manhattan (except between 96th and 42nd Streets, where service operates express); late night service operates local along its entire route.
Historically, 2 trains have also run to Crown Heights–Utica Avenue or New Lots Avenue. They ran exclusively on the IRT New Lots Line until 1983, when the 2 was routed to Flatbush Avenue. This is still the case with some rush-hour trains, although they now run to New Lots Avenue only. Same track as the 1 and 3, for more information please
go to http://web.mta.info/nyct/service/twoline.htm'},
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

trips = [
  {:train => 'A', :passenger_name => 'Test', :timestamps => "2018-12-16 14:35:00"},
  {:train => 'B', :passenger_name => 'Test',:timestamps => "2018-12-16 14:35:00"},
  {:train => 'C', :passenger_name => 'Test',:timestamps => "2018-12-16 14:35:00"},
  {:train => 'D', :passenger_name => 'Test',:timestamps => "2018-12-16 14:35:00"},
  {:train => 'E', :passenger_name => 'Wendy',:timestamps => "2018-12-16 14:35:00"}]

trips.each do |trip|
  Trip.create!(trip)
end