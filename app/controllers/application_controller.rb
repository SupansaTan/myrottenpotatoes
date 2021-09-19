class ApplicationController < ActionController::Base
<<<<<<< HEAD
    before_action :set_config
    before_action :set_current_user
    protected # prevents method from being invoked by a route
=======

    protect_from_forgery with: :exception
    before_action : set_current_user, :authenticate!, :set_config

    def set_current_user
        @current_user = Moviegoer.find_by(id: session[:user_id])
    end

    protect_from_forgery with: :exception
    before_action : set_current_user, :authenticate!, :set_config

    def set_current_user
        @current_user = Moviegoer.find_by(id: session[:user_id])
    end
>>>>>>> main

    require 'themoviedb'
    Tmdb::Api.key("56a532b46b2f4d48499071df7a75663e")

    def set_config
        @configuration = Tmdb::Configuration.new
    end

    protected
  
    def authenticate!
        
        unless @current_user
            redirect_to login_path
        end
    end



<<<<<<< HEAD
    def set_current_user
        @current_user ||= Moviegoer.find_by_id(session[:user_id])
      end
end

=======
    protected
  
    def authenticate!
        
        unless @current_user
            redirect_to login_path
        end
    end


end
>>>>>>> main
