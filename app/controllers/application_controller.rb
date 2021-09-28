class ApplicationController < ActionController::Base

    #protect_from_forgery with: :exception
    before_action  :set_current_user, :set_config

    def set_current_user
        @current_user = current_user
    end

    # config TMDB
    require 'themoviedb'
    require_relative '../../config/.tmdb_key.rb'  # get api key
    Tmdb::Api.key($api_key)

    def set_config
        @configuration = Tmdb::Configuration.new
    end
end

