class ShiftsController < ApplicationController

  get '/shifts' do
    if is_logged_in?(session)
      @shifts = Shift.all.select{|s| s.worker_id == session[:id]}
      erb :'shifts/index'
    else
      status 403
      erb :"errors/403"
    end
  end

  get 'shifts/new' do

  end

  get 'shift/:id' do

  end

  get 'shift/:id/edit' do

  end

  post '/shifts' do


  end

  patch 'shifts/:id' do

  end

  delete 'shifts/:id/delete' do
    
  end

end