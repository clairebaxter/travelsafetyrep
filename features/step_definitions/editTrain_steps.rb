=begin
require 'uri'
require 'cgi'
require File.expand_path(File.join(File.features(addTrain.feature), "..", "support", "paths"))
require File.expand_path(File.join(File.features(editTrain.feature), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

# Single-line step scoper/*When /^(.*) within (.*[^:])$/ do |step, parent|
 # with_scope(parent) { When step }
#end

# Multi-line step scoper
#When /^(.*) within (.*[^:]):$/ do |step, parent, table_or_string|
 # with_scope(parent) { When "#{step}:", table_or_string }
#end

Given /^(?:|I )am on (.+)$/ do |welcome_page|
  visit path_to(welcome_page)
end

When /^(?:|I )follow "([^"]*)$/ do |lines|
  click_link(lines)
end

Then /^(?:|I )should be on (.+)$/ do |lines|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(lines)
  else
    assert_equal path_to(lines), current_path
  end
end

When /^(?:|I )follow "([^"]*)$/ do |l|
  click_link(l)
end

Then /^(?:|I )should be on (.+)$/ do |l|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(l)
  else
    assert_equal path_to(l), current_path
  end
end

When /^(?:|I )follow "([^"]*)$/ do |edit|
  click_link(edit)
end

Then /^(?:|I )should be on (.+)$/ do |edit|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(edit)
  else
    assert_equal path_to(edit), current_path
  end
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |line, l|
  fill_in(line, :with => l)
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |yellow, color|
  select(yellow, :from => color)
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |bronx, borough|
  select(bronx, :from => borough)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |description, great|
  fill_in(description, :with => great)
end

When /^(?:|I )press "([^"]*)$/ do |save_and_open_page|
  click_button(save_and_open_page)
end

Then /^(?:|I )should be on (.+)$/ do |l|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(l)
  else
    assert_equal path_to(l), current_path
  end
end
And /^(?:|I )should see \/([^\/]*)\/$/ do |successfully|
  successfully = Regexp.new(successfully)
  end
=end
  