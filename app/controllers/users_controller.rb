class UsersController < ApplicationController
    
    
    get '/signup' do 
        erb :'users/signup'
    end

    post '/signup' do 
        @user = User.new(name: params["name"], email: params["email"], password: params["password"])
        if @user.save 
            session[:user_id] = @user.id
            redirect "/foods"
        else
            redirect '/signup'
        end
        # when the user submit the form I take the input’s values in a params hash in the post /signup route, make a new user instance and save it in the database. 
    end
   
end