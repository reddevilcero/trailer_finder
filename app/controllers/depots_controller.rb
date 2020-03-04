class DepotsController < ApplicationController
  
  get "/depots" do
    @depots = Depot.all
    erb :"/depots/index"
  end

  get "/depots/new" do
    erb :"/depots/new"
  end

  post "/depots" do
    if !Helpers.params_empty?(params[:depot])
      depot = Depot.create(params[:depot])
    else
      flash[:error] = "Please Fill out all the fields"
      redirect "/depots/new"

    end
    redirect "/depots"
  end

  get "/depots/:slug" do
    @depot = Depot.find_by_slug(params[:slug])
    if @depot
      erb :"/depots/show"
    else
      erb :'errors/404'
    end
    
  end

  get "/depots/:slug/edit" do
    @depot = Depot.find_by_slug(params[:slug])
    if @depot
      erb :"/depots/edit"
    else
      erb :'errors/404'
    end
    
  end

  patch "/depots/:slug" do
    depot = Depot.find_by_slug(params[:slug])
    if !Helpers.params_empty?(params[:depot])
      depot.update(params[:depot])
    else
      flash[:error] = "Please Fill out all the fields"
      redirect "/depots/#{depot.slug}/edit"
    end
    redirect "/depots/#{depot.slug}"
  end

  delete "/depots/:slug/delete" do
    depot = Depot.find_by_slug(params[:slug])
    depot.destroy
    redirect "/depots"
  end
end
