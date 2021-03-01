class SessionsController < ApplicationController

    
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

    
    
    get '/logout' do
        session.clear
        redirect "/"
    end
    
    
    
end
