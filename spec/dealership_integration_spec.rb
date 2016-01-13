require('capybara/rspec')
require('launchy')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the DealerShip paths') do
  before() do
    Dealership.clear()
  end

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

  describe('the view a dealership path', {:type => :feature}) do
    it("shows a dealership of the user's choice") do
      add_don_trumps_caddy_shack()
      click_dealer_link()
      expect(page).to(have_content("Don Trump's Caddy Shack"))
    end
  end
end

def add_don_trumps_caddy_shack
  visit('/')
  click_link('Add Dealership')
  fill_in('dealerName', :with => "Don Trump's Caddy Shack")
  click_button('Add')
  click_link('See Dealership List')
end

def click_dealer_link
  click_link("Don Trump's Caddy Shack")
end
