class DepotsController < ApplicationController
  
  get "/depots" do
    @depots = Depot.all
    erb :"/depots/index"
  end

  get "/depots/new" do
    erb :"/depots/new"
  end

  post "/depots" do
    depot = Depot.new(params[:depot])
    if depot.admin_id.nil?
      depot.admin = Admin.new(params[:admin])
    end
    depot.save
    admin = Admin.find_by_id(depot.admin_id)
    admin.update(depot_id:depot.id)
    redirect "/depots"
  end

  get "/depots/:slug" do
    @depot = Depot.find_by_slug(params[:slug])
    if @depot
      erb :"/depots/show"
    else
      erb :'404'
    end
    
  end

  get "/depots/:slug/edit" do
    @depot = Depot.find_by_slug(params[:slug])
    if @depot
      erb :"/depots/edit"
    else
      erb :'404'
    end
    
  end

  patch "/depots/:slug" do
    depot = Depot.find_by_slug(params[:slug])
    if Helpers.params_empty?(params[:admin])
      depot.update(params[:depot])
    else
      depot.update(params[:depot])
      depot.build_admin(params[:admin])
    end
    depot.save
    redirect "/depots/#{depot.slug}"
  end

  delete "/depots/:slug/delete" do
    redirect "/depots"
  end
end
