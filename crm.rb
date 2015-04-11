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
  if @contact
    erb :show_contact
  else
     raise Sinatra::NotFound
  end
end

get "/contacts/:id/edit" do
 @contact = $rolodex.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    $rolodex.remove_contact(@contact)
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
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
