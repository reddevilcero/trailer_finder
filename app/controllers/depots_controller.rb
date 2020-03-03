class DepotsController < ApplicationController

  get "/depots" do
    erb :"/depots/index"
  end

  get "/depots/new" do
    erb :"/depots/new"
  end

  post "/depots" do
    redirect "/depots"
  end

  get "/depots/:id" do
    erb :"/depots/show"
  end

  get "/depots/:id/edit" do
    erb :"/depots/edit"
  end

  patch "/depots/:id" do
    redirect "/depots/:id"
  end

  delete "/depots/:id/delete" do
    redirect "/depots"
  end
end
