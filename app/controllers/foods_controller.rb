class FoodsController < ApplicationController

    
    get '/foods' do 
        #binding.pry
        if logged_in?
            @foods = current_user.foods
            erb :'foods/index'
        else
            redirect "/login"
        end
    end

    
    
    get '/foods/new' do 
        if logged_in?
            erb :'foods/new' 
        else
            redirect "/login"
        end
    end

    post '/foods' do 
        if logged_in? 
            food = current_user.foods.build(params)
            if food.save 
                redirect "/foods/#{food.id}" 
            else
                redirect "/foods/new"
            end
        else
            redirect "/"
        end
    end




    
    get '/foods/:id/edit' do 
        if logged_in?
            @food = current_user.foods.find_by(params)
            if @food 
                erb :'foods/edit' 
            else
                redirect "/foods"
            end
        else
            redirect "/login"
        end
    end

    patch '/foods/:id' do 
        food = current_user.foods.find_by(id: params[:id])
        
        if food.update(name: params[:name], content: params[:content], meal: params[:meal], make_again?: params[:make_again?]) #checking to see if meal exists and has presence in its validations 
            redirect "/foods/#{food.id}"
        else
            redirect "/foods/#{food.id}/edit"
        end
    end


    
    get '/foods/:id' do 
        if logged_in?
            @food = current_user.foods.find_by(id: params[:id])

            if @food 
                erb :'foods/show'
            else 
                redirect "/foods"
            end
        else
            redirect "/login"
        end
    end



    




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