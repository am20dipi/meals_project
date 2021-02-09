class SessionsController < ApplicationController
    # inherits from ApplicationController because in our config.ru we RUN ApplicationController only.
    # manages the data related to user authentication

    get '/signup' do 
        erb: 'users/signup'
        # render signup view
    end

    post '/signup' do 
        @user = User.new(params[:user])
        if @user.save 
            session[:user_id] = @user.id
            redirect '/meals'
        else
            erb :'users/signup'
        end
        # when the user submit the form I take the input’s values in a params hash in the post /signup route, make a new user instance and save it in the database. 
    end
    
    
    
    
end