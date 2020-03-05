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

  get '/shifts/new' do # can i call it Start?
    if is_logged_in?(session) && current_user(session).rol = 'driver'

      erb :'/shifts/new'
    else
      status 403
      erb :"errors/403"
    end
  end

  get '/shift/:id' do

  end

  get '/shift/:id/edit' do

  end

  post '/shifts' do
    #Better Way to do this?
    binding.pry
    if is_logged_in?(session) && current_user(session).rol = 'driver'
      shift = Shift.new(params[:shift])
      shift.start_shift = Depot.find_by(id:params[:start_depot])
      shift.end_shift = Depot.find_by(id:params[:end_depot])

    else
      status 403
      erb :"errors/403"
    end

  end

  patch 'shifts/:id' do

  end

  delete 'shifts/:id/delete' do
    
  end

end