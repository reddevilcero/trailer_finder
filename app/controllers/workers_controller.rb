class WorkersController < ApplicationController

  get '/' do
    if is_logged_in?(session)
      redirect "profile/#{session[:id]}"
    end
    erb :index
  end

  post '/login' do
    if !params_empty?(params)
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
    if !params_empty?(params)
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
    if is_logged_in?(session) && params[:id].to_i == session[:id] || current_user(session).is_admin?
      @worker = Worker.find_by_id(params[:id])
      if @worker
        erb :'workers/show'
      else
        status 404
        erb :'errors/404'
      end
    else
     erb :'errors/403'
    end
  end

  get '/profile/:id/edit' do
    if is_logged_in?(session) && params[:id].to_i == session[:id] || current_user(session).is_admin?
      @worker = Worker.find_by_id(params[:id])
      if @worker
        erb :"workers/edit"
      else
        status 404
        erb :'errors/404'
      end
    else
     erb :'errors/403'
    end
  end

  patch '/profile/:id' do
    if is_logged_in?(session) && params[:id].to_i == session[:id] || current_user(session).is_admin?
      case params[:worker][:rol]
      when 'driver'
        worker = Driver.update(params[:id], params[:worker])
      when 'admin'
        worker = Admin.update(params[:id], params[:worker])
      else
        worker = Worker.update(params[:id], params[:worker])
      end
      if worker.valid?
        redirect "/profile/#{worker.id}"
      else
        flash[:error] = worker.errors.full_messages.first
        redirect "/profile/#{params[:id]}/edit"
      end
    else
     erb :'errors/403'
    end

  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/workers' do
    if is_logged_in?(session) && current_user(session).is_admin?
       erb :'workers/index'
    else
      status 403
      erb :'errors/403'
    end
  end
  
end