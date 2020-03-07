class DepotsController < ApplicationController
  
  get "/depots" do
    if is_logged_in?(session)
      @depots = Depot.all
      erb :"/depots/index"
    else
      status 403
      erb :'errors/403'
    end
  end

  get "/depots/new" do
    if is_logged_in?(session) && current_user(session).is_admin?
      erb :"/depots/new"
    else
      status 403
      erb :'errors/403'
    end
    
  end

  post "/depots" do
    if is_logged_in?(session) && current_user(session).is_admin?
      if !params_empty?(params[:depot])
       depot = Depot.create(params[:depot])
      else
        flash[:error] = "Please Fill out all the fields"
        redirect "/depots/new"
      end
      redirect "/depots"
    else
      status 403
      erb :'errors/403'
    end
 
  end

  get "/depots/:slug" do
    if is_logged_in?(session)
       @permission = is_logged_in?(session) && current_user(session).is_admin?
      @depot = Depot.find_by_slug(params[:slug])
      if @depot
       erb :"/depots/show"
      else
        status 404
        erb :'errors/404'
      end
    else
      status 403
      erb :'errors/403'
    end
   
    
  end

  get "/depots/:slug/edit" do
    if is_logged_in?(session) && current_user(session).is_admin?
      @depot = Depot.find_by_slug(params[:slug])
      if @depot
        erb :"/depots/edit"
      else
        status 404
        erb :'errors/404'
      end
    else
      status 403
      erb :'errors/403'
    end

  end

  patch "/depots/:slug" do
    if is_logged_in?(session) && current_user(session).is_admin?
      depot = Depot.find_by_slug(params[:slug])
      if !params_empty?(params[:depot])
        depot.update(params[:depot])
      else
        flash[:error] = "Please Fill out all the fields"
        redirect "/depots/#{depot.slug}/edit"
      end
      redirect "/depots/#{depot.slug}"
    else
       status 403
      erb :'errors/403'
    end
  end

  delete "/depots/:slug/delete" do
    if is_logged_in?(session) && current_user(session).is_admin?
      depot = Depot.find_by_slug(params[:slug])
      depot.destroy
      redirect "/depots"
    else
      status 403
      erb :'errors/403'
    end
  end
end
