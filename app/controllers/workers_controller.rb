class WorkersController < ApplicationController

  get '/' do
    if is_logged_in?(session)
      redirect "profiles/#{session[:id]}"
    end
    erb :index
  end

  post '/login' do
    if !params_empty?(params)
      worker = Worker.find_by(email:params[:email].downcase).try('authenticate', params[:password])
      binding.pry
      if worker
        session[:user_id] = worker.id
        binding.pry
        redirect "/profiles/#{worker.id}"
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
        redirect "/profiles/#{worker.id}/edit"
      else
        flash[:error] = worker.errors.full_messages.first
        redirect '/'
      end
    else
      flash[:error] = 'Please Fill out all the Fields'
      redirect '/'
    end

  end

  get '/profiles/:id' do
    binding.pry
    if is_logged_in?(session) && (params[:id].to_i == session[:id] || current_user(session).is_admin?)
      @worker = Worker.find_by_id(params[:id])
      if @worker
        erb :'workers/show'
      else
        status 404
        erb :'errors/404'
      end
    else
      flash[:error] = 'You need To be logged'
      status 403
     erb :'errors/403'
    end
  end

  get '/profiles/:id/edit' do
    if is_logged_in?(session) && (params[:id].to_i == session[:id] || current_user(session).is_admin?)
      @worker = Worker.find_by_id(params[:id])
      if @worker
        erb :"workers/edit"
      else
        status 404
        erb :'errors/404'
      end
    else
      flash[:error] = 'You need To be logged'
      status 403
     erb :'errors/403'
    end
  end

  patch '/profiles/:id' do
    if is_logged_in?(session) && (params[:id].to_i == session[:id] || current_user(session).is_admin?)
      case params[:worker][:rol]
      when 'driver'
        worker = Driver.update(params[:id], params[:worker])
      when 'admin'
        worker = Admin.update(params[:id], params[:worker])
      else
        worker = Worker.update(params[:id], params[:worker])
      end
      if worker.valid?
        redirect "/profiles/#{worker.id}"
      else
        flash[:error] = worker.errors.full_messages.first
        redirect "/profiles/#{params[:id]}/edit"
      end
    else
      flash[:error] = 'You need To be logged'
      status 403
     erb :'errors/403'
    end

  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/profiles' do
    if is_logged_in?(session) && current_user(session).is_admin?
       erb :'workers/index'
    else
      flash[:error] = 'You need To be logged'
      status 403
      erb :'errors/403'
    end
  end

  delete '/profiles/:id/delete' do
      if is_logged_in?(session) && current_user(session).is_admin?
        binding.pry
        worker = Worker.find_by_id(params[:id])
        worker.destroy
        redirect '/profiles'
      else
        flash[:error] = 'You need To be logged'
        status 403
        erb :'errors/403'
      end
  end
  
end