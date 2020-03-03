class TrailersController < ApplicationController

  # GET: /trailers
  get "/trailers" do
    erb :"/trailers/index"
  end

  # GET: /trailers/new
  get "/trailers/new" do
    erb :"/trailers/new"
  end

  # POST: /trailers
  post "/trailers" do
    redirect "/trailers"
  end

  # GET: /trailers/5
  get "/trailers/:trailer_number" do
    @trailer = Trailer.find_by_trailer_number(params[:trailer_number])
    erb :"/trailers/show"
  end

  # GET: /trailers/5/edit
  get "/trailers/:trailer_number/edit" do
    erb :"/trailers/edit"
  end

  # PATCH: /trailers/5
  patch "/trailers/:trailer_number" do
    redirect "/trailers/:id"
  end

  # DELETE: /trailers/5/delete
  delete "/trailers/:trailer_number/delete" do
    redirect "/trailers"
  end
end
