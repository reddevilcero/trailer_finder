class DepotsController < ApplicationController
  
  get "/depots" do
    # binding.pry
    erb :"/depots/index"
  end

  get "/depots/new" do
    erb :"/depots/new"
  end

  post "/depots" do
    redirect "/depots"
  end

  get "/depots/:slug" do
    @depot = Depot.find_by_slug(params[:slug])
    erb :"/depots/show"
  end

  get "/depots/:slug/edit" do
    erb :"/depots/edit"
  end

  patch "/depots/:slug" do
    redirect "/depots/:slug"
  end

  delete "/depots/:slug/delete" do
    redirect "/depots"
  end
end
