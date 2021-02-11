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


  helpers do 

    def logged_in?
      #binding.pry
      !!session[:user_id]
      # the double bang operator return T or F
      # we are asking "is someone logged in?" via if their user id is stored in the sessions hash
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id]) if logged_in?
      # ||= "or equals" 
      # Memoization: there may be multiple calls to current_user
      # Is there a current_user ? give it to me. If not, hand one in. 
      # If @user is undefined then define it as a whatever follows the ||= sign. 
      # We store the result of User.find_by to the instance variable @user.
    end

  end

end
