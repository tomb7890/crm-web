require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'


$rolodex= Rolodex.new


get '/' do
  @crm_app_name = "My CRM"
  erb :index
end


get "/contacts" do
  erb :contacts
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
