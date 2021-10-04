class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    before_action  :set_current_user, :authenticate!, :set_config

    def set_current_user
        @current_user = current_user
    end

    # config TMDB
    require 'themoviedb'
<<<<<<< HEAD
    require_relative '../../config/tmdb_key.rb'  # get api key
=======
    require_relative '../../config/.tmdb_key.rb'  # get api key
>>>>>>> 828b54d5ad1511051c2b1a4592d6eae771af0426
    Tmdb::Api.key($api_key)

    def set_config
        @configuration = Tmdb::Configuration.new
    end

    protected

    def authenticate!
        unless @current_user
            flash[:warning] = 'You must be logged in with Facebook before.'
        end
    end
end
