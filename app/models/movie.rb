class Movie < ActiveRecord::Base
    def movie_params
        params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
    
end