require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle')
require('./lib/dealership')

get('/') do
  erb(:index)
end

get('/dealerships/new') do
  erb(:dealership_form)
end

get('/dealerships') do
  @dealerships = Dealership.all()
  erb(:dealerships)
end

post('/dealerships') do
  new_dealer = params[:dealerName]
  Dealership.new(new_dealer).save()
  @dealerships = Dealership.all()
  erb(:success)
end

get('/dealerships/:id') do
  @dealership = Dealership.find(params[:id].to_i())
  erb(:dealership)
end
