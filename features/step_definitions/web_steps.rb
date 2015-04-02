Given(/^a user is on the homepage$/) do
  visit '/'
end

Then(/^they see "(.*?)"$/) do |word|
  expect(page).to have_content word
end

When(/^they fill in "([^"]*)" in the title field$/) do |name|
  fill_in('title', :with => name)
end

When(/^they press the "([^"]*)" button$/) do |register|
  click_button(register)
end

Then(/^they see a "(.*?)" table$/) do |table|
  expect(page).to have_table table
end

Given(/^a user is on the game page$/) do
  visit '/game'
end

When(/^they come back to game page$/) do
  visit '/game'
end

When(/^they fill in "([^"]*)" in coord_input field$/) do |arg1|
  fill_in('coord_input', :with => arg1)
end
