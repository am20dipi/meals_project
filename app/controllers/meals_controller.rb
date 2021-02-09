class MealsController < ApplicationController
    # inherits from ApplicationController because in our config.ru we RUN ApplicationController only.

    # INDEX
    get '/meals' do 
        @meals = Meal.all
        #instance variable allows access in the view
        erb :'meals/index' #rendering the index view
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



    # NEW



    # UPDATE



    # DELETE


end