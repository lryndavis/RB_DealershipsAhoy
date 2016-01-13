require('capybara/rspec')
require('launchy')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add dealership path', {:type => :feature}) do
  it('adds a new dealership to the list') do
    visit('/')
    click_link('Add Dealership')
    fill_in('dealerName', :with => "Don Trump's Caddy Shack")
    click_button('Add')
    click_link('See Dealership List')
    expect(page).to(have_content("Don Trump's Caddy Shack"))
  end
end
