require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'moneymoney' 
  end

  get "/" do
    erb :home
  end

  not_found do 
    status 404
    erb :'error'
  end


  helpers do 

    def logged_in?
      #binding.pry
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end

  end

end
