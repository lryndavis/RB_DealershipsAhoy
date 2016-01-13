require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')
require('./lib/dealership')

get('/') do
  erb(:index)
end

# Renders dealership form
get('/dealerships/new') do
  erb(:dealership_form)
end

# Renders dealership list
get('/dealerships') do
  @dealerships = Dealership.all()
  erb(:dealerships)
end

# Posts dealership form and renders success page
post('/dealerships') do
  new_dealer = params[:dealerName]
  Dealership.new(new_dealer).save()
  @dealerships = Dealership.all()

  clear_setting = params[:clear_setting]
  if clear_setting == "clicked"
    Dealership.clear()
  end

  erb(:success_dealer)
end

# Renders page for a specific dealership
get('/dealerships/:id') do
  @dealership = Dealership.find(params[:id].to_i())
  erb(:dealership)
end

# Renders new vehicle form for a specific dealership
get('/dealerships/:id/vehicles/new') do
  @dealership = Dealership.find(params[:id].to_i())
  erb(:dealership_vehicles_form)
end

# Posts vehicle form and renders success page
post('/vehicles') do
  make = params[:make]
  model = params[:model]
  year = params[:year]
  dealership_id = params[:dealershipID]
  @vehicle = Vehicle.new(make, model, year, dealership_id)
  @vehicle.save()
  @dealership = Dealership.find(params[:dealershipID].to_i())
  @dealership.add_vehicle(@vehicle)
  erb(:success_vehicle)
end

# Renders page for a specific vehicle
get('/vehicles/:id') do
  @vehicle = Vehicle.find(params[:id].to_i())
  @dealership = Dealership.find(@vehicle.dealership_id().to_i())
  erb(:vehicle)
end
