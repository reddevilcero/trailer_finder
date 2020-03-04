class WorkersController < ApplicationController

  get '/' do

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

  get '/profile/:id' do
    if Helpers.is_logged_in?(session) && params[:id].to_i == session[:id]
    'working'
    else
     erb :'errors/403'
    end
  end
  
end