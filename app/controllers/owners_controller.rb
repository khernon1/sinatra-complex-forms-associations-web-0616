class OwnersController < ApplicationController

  #index
  get '/owners' do
    @owners = Owner.all
    erb :'/owners/index' 
  end

  #new
  get '/owners/new' do 
    erb :'/owners/new'
  end

  #create
  post '/owners' do 
    @owner = Owner.create(params[:owner])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    redirect to "owners/#{@owner.id}"
  end

  #edit form
  get '/owners/:id/edit' do     
    @owner = Owner.find(params[:id])
    erb :'/owners/edit'
    #binding.pry
  end

  #edit action
  post '/owners/:id' do 
    @owner = Owner.find(params[:id])
    @owner.update(params["owner"])
      if !params["pet"]["name"].empty?
        @owner.pets << Pet.create(name: params["pet"]["name"])
      end
    redirect to "owners/#{@owner.id}"
  end

  #show
  get '/owners/:id' do 
   @owner = Owner.find(params[:id])
   erb :'owners/show'
  end
end