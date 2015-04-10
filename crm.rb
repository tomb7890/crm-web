require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'
require 'faker'


$rolodex = Rolodex.new

19.times do 
  $rolodex.add_contact(Faker::Name.first_name, 
                       Faker::Name.last_name,
                       Faker::Internet.email, 
                       "#{Faker::Hacker.verb.capitalize } the 
                       #{Faker::Hacker.adjective} 
                       #{Faker::Hacker.noun}." ) 

end


get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get "/contacts" do
  erb :contacts
end

get "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  erb :show_contact
end

# as the last route, add
get '/contacts/new' do
  erb :new_contact
end

# at the end of the file
post '/contacts' do
  $rolodex.add_contact(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end
