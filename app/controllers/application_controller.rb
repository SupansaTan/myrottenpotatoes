class ApplicationController < ActionController::Base
    before_action :set_config

    require 'themoviedb'
    Tmdb::Api.key("56a532b46b2f4d48499071df7a75663e")

    def set_config
        @configuration = Tmdb::Configuration.new
    end
end