class WorkersController < ApplicationController

  get '/' do
    if Helpers.is_logged_in?(session)
      redirect "profile/#{session[:id]}"
    end
    erb :index
  end

  post '/login' do
    if !Helpers.params_empty?(params)
      worker = Worker.find_by(email:params[:email].downcase).try('authenticate', params[:password])
      if worker
        session[:id] = worker.id
        redirect "/profile/#{worker.id}"
      else
        flash[:error] = 'Password or Email are incorrect, Please Try again'
        redirect '/'
      end
    else
      flash[:error] = 'Please Fill out all the Fields'
      redirect '/'
    end
  end

  post '/signup' do
    if !Helpers.params_empty?(params)
      worker = Worker.new(params)
      if worker.save
        session[:id] = worker.id
        redirect "/profile/#{worker.id}/edit"
      else
        flash[:error] = worker.errors.full_messages
        redirect '/'
      end
    else
      flash[:error] = 'Please Fill out all the Fields'
      redirect '/'
    end

  end

  get '/profile/:id' do
    if Helpers.is_logged_in?(session) && params[:id].to_i == session[:id]
      @worker = Helpers.current_user(session)
      erb :'workers/show'
    else
     erb :'errors/403'
    end
  end

  get '/profile/:id/edit' do
    if Helpers.is_logged_in?(session) && params[:id].to_i == session[:id]
      @worker = Helpers.current_user(session)
      erb :"workers/edit"
    else
     erb :'errors/403'
    end
  end

  patch '/profile/:id' do
    if Helpers.is_logged_in?(session) && params[:id].to_i == session[:id]
      case params[:worker][:rol]
      when 'driver'
        @worker = Driver.update(params[:id], params[:worker])
      when 'admin'
        @worker = Admin.update(params[:id], params[:worker])
      else
        @worker = Worker.update(params[:id], params[:worker])
      end
      if @worker.valid?
        redirect "/profile/#{@worker.id}"
      else
        flash[:error] = @worker.errors.full_messages.first
        redirect '/profile/:id/edit'
      end
    else
     erb :'errors/403'
    end

  end

  get '/logout' do
    session.clear
    redirect '/'
  end
  
end