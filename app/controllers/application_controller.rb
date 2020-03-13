require './config/environment'

class ApplicationController < Sinatra::Base
  helpers Sinatra::Helpers

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret,  ENV['SESSION_SECRET'] { SecureRandom.hex(64) }
    register Sinatra::Flash
  end

end
