class ShiftsController < ApplicationController

  get '/shifts' do
    if is_logged_in?(session)
      @shifts = Shift.all.select{|s| s.worker_id == session[:id]}
      erb :'shifts/index'
    else
      flash[:error] = 'You need To be logged'
      status 403
      erb :"errors/403"
    end
  end

  get '/shifts/new' do # can i call it Start?
    if is_logged_in?(session) && current_user(session).rol == 'driver'
      erb :'/shifts/new'
    else
      flash[:error] = 'You need To be logged'
      status 403
      erb :"errors/403"
    end
  end

  get '/shifts/:id' do
    if is_logged_in?(session) && current_user(session).rol == 'driver'
      @shift = Shift.find_by_id(params[:id])
      if @shift
        erb :'/shifts/show'
      else
        status 404
        erb :"errors/404"
      end
    else
      flash[:error] = 'You need To be logged'
      status 403
      erb :"errors/403"
    end
  end

  get '/shifts/:id/edit' do
    @shift = Shift.find_by_id(params[:id])
    erb :'shifts/edit'
  end

  post '/shifts' do
    #Better Way to do this?
    if is_logged_in?(session) && current_user(session).rol == 'driver'
      shift = Shift.new(params[:shift])
      shift.start_depot= Depot.find_by(id:params[:start_depot])
      shift.end_depot = Depot.find_by(id:params[:end_depot])
      if shift.save
        flash[:success] ='New Shift Successfully created'
        redirect "/shifts/#{shift.id}"
      else
        status 500
        erb :'errors/500'
      end
    else
      flash[:error] = 'You need To be logged'
      status 403
      erb :"errors/403"
    end
  end
  patch '/shifts/:id' do

    if is_logged_in?(session) && current_user(session).rol == 'driver'
      shift = Shift.find_by_id(params[:id])
      if shift.update(params[:shift])
        if shift.incomplete?
          shift.end_depot = Depot.find_by(id:params[:end_depot])
          shift.save
        end
        flash[:success] ='Shift Successfully Updated'
        redirect "/shifts/#{shift.id}"
      else
        status 500
        erb :'errors/500'
      end
    else
      flash[:error] = 'You need To be logged'
      status 403
      erb :"errors/403"
    end
  end

  # delete '/shifts/:id/delete' do
    # not sure if make it
  # end

end