require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'


get '/' do
  @crm_app_name = "My CRM"
  erb :index
end


get "/contacts" do
  @contacts = []
  @contacts << Contact.new("10", "Yehuda", "Katz", "yehuda@example.com", "Developer")
  @contacts << Contact.new("11", "Mark", "Zuckerberg", "mark@facebook.com", "CEO")
  @contacts << Contact.new("12", "Sergey", "Brin", "sergey@google.com", "Co-Founder")
  erb :contacts
end
