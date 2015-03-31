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

Then(/^they see a "([^"]*)" table$/) do |table|
  expect(page).to have_table table
end

# Then(/^they see:$/) do |table|
#   # table is a Cucumber::Core::Ast::DataTable
#   expect(page).to have_table table
# end
# And they see:
#  |||
