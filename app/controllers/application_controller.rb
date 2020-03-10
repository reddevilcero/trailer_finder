require './config/environment'
require 'securerandom'

class ApplicationController < Sinatra::Base
  helpers Sinatra::Helpers

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions            #why it does works???
    set :session_secret, 'secret' #ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    register Sinatra::Flash
  end

end
