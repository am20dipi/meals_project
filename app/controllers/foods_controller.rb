class FoodsController < ApplicationController
    # inherits from ApplicationController because in our config.ru we RUN ApplicationController only.

    # INDEX
    get '/foods' do 
        #binding.pry
        if logged_in?
            @foods = current_user.foods
            #instance variable allows access in the view
            # using ActiveRecord associations to call .meals on current_user to receive only their meals; not everyone elses
            erb :'foods/index' #rendering the index view
        else
            redirect "/login"
        end
    end

    
    # NEW
    get '/foods/new' do 
        if logged_in?
            erb :'foods/new' # render to new view
        else
            redirect "/login"
        end
    end

    post '/foods' do 
        if logged_in? 
            food = current_user.foods.build(params)
            # Active Record association; calling .meals on current_user
            # .build method; does NOT save; returns T or F
            if food.save 
                redirect "/foods/#{food.id}" 
            else
                redirect "/foods/new"
            end
        else
            redirect "/"
        end
    end




    # UPDATE
    get '/foods/:id/edit' do 
        if logged_in?
            @food = current_user.foods.find_by(params)
            if @food #only if a meal exists can you render the edit form.
                erb :'foods/edit' # render the edit form
            else
                redirect "/foods"
            end
        else
            redirect "/login"
        end
    end

    patch '/foods/:id' do 
        # comes from Middleware Rack::MethodOverride; 
        # it is looking for key "_method"; if there is one in params, the value associated with the key is PATCH.
        food = current_user.foods.find_by(id: params[:id])
        
        if food.update(name: params[:name], content: params[:content], meal: params[:meal], make_again?: params[:make_again?]) #checking to see if meal exists and has presence in its validations 
            redirect "/foods/#{food.id}"
        else
            redirect "/foods/#{food.id}/edit"
        end
    end


    # SHOW
    get '/foods/:id' do # :id adds the key in the params hash; the number after the colon becomes the key in the hash
        if logged_in?
            @food = current_user.foods.find_by(id: params[:id])

            if @food #if a meal exists, then render the show view.
                erb :'foods/show'
                #redirect "/foods/#{@food.id}"
            else #if not, then redirect back to index.
                redirect "/foods"
            end
        else
            redirect "/login"
        end
    end



    



    # DELETE
    delete '/foods/:id' do 
        if logged_in?
            @food = current_user.foods.find_by(id: params[:id])
            if @food
                @food.destroy
            end
            redirect "/foods"
        else
            redirect "/login"
        end
    end


end