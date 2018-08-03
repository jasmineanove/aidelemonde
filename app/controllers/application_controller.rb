require './config/environment'
require './app/models/sample_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    return erb :home
  end
  
  get '/survey' do
    return erb :index
  end  
  
  
  post '/survey' do
      @irritation_response = params[:irritation]
      @travel_response = params[:travel]
      @service_response = params[:service]
      @donation_response = params[:donation]
      @info_response = params[:info]
      
      surv = Survey.new
      @message = surv.show(@irritation_response, @travel_response, @service_response, @donation_response, @info_response)
      
      return erb :results
  end
  
end