
require 'sinatra/base'
module Sinatra 
  module Helpers
    def params_empty?(params)
      if !params.empty? 
        params.any? do |k,v|
          v.empty?
        end
      else
        params.empty?
      end
    end

    def is_logged_in?(session)
      !!session[:id]
    end

    def current_user(session)
      Worker.find_by_id(session[:id])
    end 
  end

  helpers Helpers
end