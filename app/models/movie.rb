class Movie < ActiveRecord::Base
    has_many :reviews
    
    def movie_params
        params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
    
end