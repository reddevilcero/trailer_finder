class TrailersController < ApplicationController

  get "/trailers" do
    if is_logged_in?(session)
      @trailers = Trailer.all
      erb :"/trailers/index" 
    else
      status 403
      erb :'errors/403'
    end
  end
  

  get "/trailers/new" do
    if is_logged_in?(session) && current_user(session).is_admin?
      erb :"/trailers/new"
    else
      status 403
      erb :'errors/403'
    end
    
  end

 
  post "/trailers" do
    if is_logged_in?(session) && current_user(session).is_admin?
      trailer = Trailer.new(params[:trailer])
      if trailer.save
        flash[:success] ='New Trailer Successfully created'
        redirect "/trailers/#{trailer.identifier}"
      else
        flash[:error] = trailer.errors.full_messages.first
        redirect '/trailers/new'
      end
    else
      status 403
      erb :'errors/403'
    end
  end

  get "/trailers/:identifier" do
    if is_logged_in?(session)
      @trailer = Trailer.find_by(identifier: params[:identifier])
      if @trailer
        erb :"/trailers/show"
      else
        status 404
        erb :'errors/404'
      end
    else
      status 403
      erb :'errors/403'
    end

  end

  get "/trailers/:identifier/edit" do
    if is_logged_in?(session) && current_user(session).is_admin?
      @trailer = Trailer.find_by(identifier: params[:identifier]) 
      if @trailer
        erb :"/trailers/edit"
      else
        erb :'404'
      end
    else
      status 403
      erb :'errors/403'
    end
  end

  patch "/trailers/:identifier" do
    if is_logged_in?(session) && current_user(session).is_admin?
      trailer = Trailer.find_by(identifier: params[:identifier])
      if trailer.update(params[:trailer])
        flash[:success] ='Trailer Successfully Updated'
        redirect "/trailers/#{trailer.identifier}"
      else
        flash[:error] = trailer.errors.full_messages.first
        redirect "/trailers/#{params[:identifier]}/edit"
      end
    else
      status 403
      erb :'errors/403'
    end

    
  end

  delete "/trailers/:identifier/delete" do
    if is_logged_in?(session) && current_user(session).is_admin?
      trailer = Trailer.find_by(identifier: params[:identifier])
      trailer.destroy
      flash[:warning] = "The Trailer #{params[:identifier]} has been delete"
      redirect "/trailers"
    else
      status 403
      erb :'errors/403'
    end
  end
end
