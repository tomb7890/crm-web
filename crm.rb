require 'sinatra'
require_relative 'contact'


get '/' do
  @crm_app_name = "My CRM"
  erb :index
end


get "/contacts" do
  @contacts = []
  @contacts << Contact.new("Yehuda", "Katz", "yehuda@example.com", "Developer", "10")
  @contacts << Contact.new("Mark", "Zuckerberg", "mark@facebook.com", "CEO", "11")
  @contacts << Contact.new("Sergey", "Brin", "sergey@google.com", "Co-Founder", "12")
  erb :contacts
end
