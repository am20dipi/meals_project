class SessionsController < ApplicationController
    # inherits from ApplicationController because in our config.ru we RUN ApplicationController only.
    # manages the data related to user authentication

    
    get '/login' do 
        erb :'sessions/login'
    end

    post '/login' do 
        user = User.find_by(email: params[:email]) # find_by returns nil if it doesnt not find anything
        if user && user.authenticate(params[:password]) # if user exists AND user is authenticated(via BCrypt through password), log them in through session
            session[:user_id] = user.id # the line of login; going into the session hash finding the :user_id key and setting this user.id as the value 
            redirect "/foods"
        else
            redirect "/login"
        end
    end
    # the act of logging in is the simple action of storing a user's id in the session hash.

    
    
    get '/logout' do
        session.clear
        redirect "/"
    end
    # the act of logging out is the simple action of clearing the session hash; meaning no user id is stored. 
    
    
    
end
