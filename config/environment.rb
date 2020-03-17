# frozen_string_literal: true

ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/deployed_development')

require './app/controllers/application_controller'
require_all 'app'