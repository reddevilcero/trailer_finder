class TrailersController < ApplicationController

  get "/trailers" do
    erb :"/trailers/index" 
  end


  get "/trailers/new" do
    erb :"/trailers/new"
  end

 
  post "/trailers" do
    trailer = trailer.new(params[:trailer])
    if trailer.save
      redirect "/trailers/#{trailer_number}"
    else
      
    end
    
  end

  
  get "/trailers/:trailer_number" do
    @trailer = Trailer.find_by_trailer_number(params[:trailer_number])
    erb :"/trailers/show"
  end

    get "/trailers/:trailer_number/edit" do
    erb :"/trailers/edit"
  end

  patch "/trailers/:trailer_number" do
    redirect "/trailers/:id"
  end

  delete "/trailers/:trailer_number/delete" do
    redirect "/trailers"
  end
end
