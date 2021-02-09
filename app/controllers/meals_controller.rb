class MealsController < ApplicationController
    # inherits from ApplicationController because in our config.ru we RUN ApplicationController only.

    # INDEX
    get '/meals' do 
        #binding.pry
        if logged_in?
            @meals = current_user.meals
            #instance variable allows access in the view
            # using ActiveRecord associations to call .meals on current_user to receive only their meals; not everyone elses
            erb :'meals/index' #rendering the index view
        else
            redirect "/login"
        end
    end

    
    # NEW
    get '/meals/new' do 
        if logged_in?
            erb :'meals/new' # render to new view
        else
            redirect "/login"
        end
    end

    post '/meals' do 
        meal = current_user.meals.build(params)
        # Active Record association; calling .meals on current_user
        # .build method; does NOT save; returns T or F
        if meal.save 
            redirect "/meals/#{meal.id}" 
        else
            redirect "/meals/new"
        end
    end



    # UPDATE
    get '/meals/:id/edit' do 
        if logged_in?
            @meal = current_user.meals.find_by(params)
            if @meal #only if a meal exists can you render the edit form.
                erb :'meals/edit' # render the edit form
            else
                redirect "/meals"
            end
        else
            redirect "/login"
        end
    end

    patch '/meals/:id' do 
        meal = Meal.find_by(id: params[:id])
        if meal.update(name: params[:name], content: params[:content], type: params[:type]) #checking to see if meal exists and has presence in its validations 
            redirect "/meals/#{meal.id}"
        else
            redirect "/meals/#{meal.id}/edit"
        end
    end



    # SHOW
    get '/meals/:id' do # :id adds the key in the params hash; the number after the colon becomes the key in the hash
        @meal = Meal.find_by(id: params[:id])

        if @meal #if a meal exists, then render the show view.
            erb :'meals/show'
        else #if not, then redirect back to index.
            redirect "/meals"
        end

    end



    # DELETE
    delete '/meals/:id' do 
        @meal = Meal.find_by(id: params[:id])
        @meal.destroy
        redirect "/meals"
    end


end