class MealsController < ApplicationController
    # inherits from ApplicationController because in our config.ru we RUN ApplicationController only.

    # INDEX
    get '/meals' do 
        @meals = Meal.all
        #instance variable allows access in the view
        erb :'meals/index' #rendering the index view
    end



    # SHOW



    # NEW



    # UPDATE



    # DELETE


end