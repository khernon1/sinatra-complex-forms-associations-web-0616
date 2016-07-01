class PetsController < ApplicationController

  #index
  get '/pets' do
    @pets = Pet.all
#    binding.pry    
    erb :'/pets/index' 
  end

  #new
  get '/pets/new' do 
    erb :'/pets/new'
  end

  #create
  post '/pets' do      
    @pet = Pet.create(name: params[:pet][:name], owner_id: params[:pet][:owner_id])
    if params[:pet][:owner_id] == nil
      @pet = Pet.create(params[:pet]) 
    end
    redirect to "pets/#{@pet.id}"
  end

  #show
  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  #edit
  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    #binding.pry
    erb :'pets/edit'
  end
   
   #update
   post '/pets/:id' do 
      pet = Pet.find(params[:id])     
      
      pet.update(name: params[:pet][:name], owner_id: params[:pet][:owner_id])
      #binding.pry
    if !params[:owner][:name].empty?
      owner = Owner.create(params[:owner])
      pet.update(owner_id: owner.id)
    end
     #pet.update(name: params[:pet][:name], owner_id: params[:owner][:name])
     redirect to "pets/#{@pet.id}"
   end

end