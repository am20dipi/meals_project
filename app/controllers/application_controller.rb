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
      @user ||= User.find(id: params[:id])
      # ||= "or equals" 
      # Memoization: there may be multiple calls to current_user
      # Is there a current_user ? If not hand one in. 
      # If @user is undefined then define it as a whatever follows the ||= sign. 
      # We store the result of User.find to the instance variable @user.
    end
end
