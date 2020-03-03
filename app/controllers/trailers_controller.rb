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
  get "/trailers/:id" do
    erb :"/trailers/show"
  end

  # GET: /trailers/5/edit
  get "/trailers/:id/edit" do
    erb :"/trailers/edit"
  end

  # PATCH: /trailers/5
  patch "/trailers/:id" do
    redirect "/trailers/:id"
  end

  # DELETE: /trailers/5/delete
  delete "/trailers/:id/delete" do
    redirect "/trailers"
  end
end
