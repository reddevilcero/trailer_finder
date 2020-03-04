class TrailersController < ApplicationController

  get "/trailers" do
    erb :"/trailers/index" 
  end


  get "/trailers/new" do
    erb :"/trailers/new"
  end

 
  post "/trailers" do
    trailer = Trailer.new(params[:trailer])
    if trailer.save
      flash[:success] ='New Trailer Successfully created'
      redirect "/trailers/#{trailer.identifier}"
    else
      flash[:error] = trailer.errors.full_messages.first
      redirect '/trailers/new'
    end
    
  end

  get "/trailers/:identifier" do
    @trailer = Trailer.find_by(identifier: params[:identifier])
  
    if @trailer
      erb :"/trailers/show"
    else
      erb :'404'
    end
  end

  get "/trailers/:identifier/edit" do
    @trailer = Trailer.find_by(identifier: params[:identifier]) 
    if @trailer
      erb :"/trailers/edit"
    else
      erb :'404'
    end
  end

  patch "/trailers/:identifier" do
    trailer = Trailer.find_by(identifier: params[:identifier])
    # binding.pry
    if trailer.update(params[:trailer])
      flash[:success] ='Trailer Successfully Update'
      redirect "/trailers/#{trailer.identifier}"
    else
      flash[:error] = trailer.errors.full_messages.first
      redirect "/trailers/#{params[:identifier]}/edit"
    end
    
  end

  delete "/trailers/:identifier/delete" do
    trailer = Trailer.find_by(identifier: params[:identifier])
    trailer.destroy
    flash[:warning] = "The Trailer #{params[:identifier]} has been delete"
    redirect "/trailers"
  end
end
