require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end


  helpers do 

    def logged_in?
      !!session[:user_id] = user.id
      # the double bang operator return T or F
      # we are asking "is someone logged in?" via if their user id is stored in the sessions hash
    end

    def current_user
      @user ||= 

    end
end
