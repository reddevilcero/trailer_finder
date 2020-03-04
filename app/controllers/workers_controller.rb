class WorkersController < ApplicationController

  get '/' do

    erb :index
  end

  post '/login' do
    binding.pry

  end
  
end