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
      click_link('Go to Dealership List')
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

  describe('the add a vehicle to a dealership path', {:type => :feature}) do
    it("adds a new vehicle to the dealership's list") do
      add_don_trumps_caddy_shack()
      click_dealer_link()
      click_link("Add a Vehicle")
      fill_in('make', :with => 'Toyota')
      fill_in('model', :with => 'Camry')
      fill_in('year', :with => '1989')
      click_button('Add')
      click_link("Go to Don Trump's Caddy Shack")
      expect(page).to(have_content('1989 Toyota Camry'))
    end
  end

  describe('the view a vehicle path', {:type => :feature}) do
    it("shows a vehicle of the user's choice") do
      add_don_trumps_caddy_shack()
      click_dealer_link()
      add_a_camry()
      click_link("Go to Don Trump's Caddy Shack")
      click_link('1989 Toyota Camry')
      expect(page).to(have_content('Toyota Camry 1989'))
    end
  end
end

def add_don_trumps_caddy_shack
  visit('/')
  click_link('Add Dealership')
  fill_in('dealerName', :with => "Don Trump's Caddy Shack")
  click_button('Add')
  click_link('Go to Dealership List')
end

def click_dealer_link
  click_link("Don Trump's Caddy Shack")
end

def add_a_camry
  click_link("Add a Vehicle")
  fill_in('make', :with => 'Toyota')
  fill_in('model', :with => 'Camry')
  fill_in('year', :with => '1989')
  click_button('Add')
end
