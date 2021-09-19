class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    before_action   :set_current_user, :authenticate!, :set_config

    def set_current_user
        @current_user = Moviegoer.find_by(id: session[:user_id])
    end

    # config TMDB
    require 'themoviedb'
    Tmdb::Api.key("56a532b46b2f4d48499071df7a75663e")

    def set_config
        @configuration = Tmdb::Configuration.new
    end

    protected

    def authenticate!
        unless @current_user
            #redirect_to login_path
        end
    end
end

