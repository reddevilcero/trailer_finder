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
      redirect "/trailers/#{trailer.trailer_number}"
    else
      flash[:error] = trailer.errors.full_messages.first
      redirect '/trailers/new'
    end
    
  end

  
  get "/trailers/:trailer_number" do
    @trailer = Trailer.find_by(trailer_number: params[:trailer_number])
    erb :"/trailers/show"
  end

  get "/trailers/:trailer_number/edit" do
    @trailer = Trailer.find_by(trailer_number: params[:trailer_number]) 

    erb :"/trailers/edit"
  end

  patch "/trailers/:trailer_number" do
    redirect "/trailers/:id"
  end

  delete "/trailers/:trailer_number/delete" do
    redirect "/trailers"
  end
end
