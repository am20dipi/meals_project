class SessionsController < ApplicationController
    # inherits from ApplicationController because in our config.ru we RUN ApplicationController only.
    # manages the data related to user authentication

    get '/login' do 

    end

    post '/login' do 
    
    end
    # the act of logging in is the simple action of storing a user's id in the session hash.

    
    
    get '/signup' do 

    end

    post '/signup' do 
    
    end

    

    
    
    get '/logout' do

    end
    # the act of logging out is the simple action of clearing the session hash; meaning no user id is stored. 
end