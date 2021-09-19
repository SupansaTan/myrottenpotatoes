class MoviesController < ApplicationController
    def index
        movies = Movie.all
        @sort_movies = movies.sort_by(&:title)
    end

    def show
        begin
            id = params[:id]
            @movie = Movie.find(id)

        rescue ActiveRecord::RecordNotFound => e
            flash[:warning] = "No movie with the given ID could be found."
            return redirect_to movies_path
        end
    end

    def new
        # default: render 'new' template
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to movie_path(@movie)
        end

        flash[:notice] = "#{@movie.title} was successfully created."
    end

    def edit
        @movie = Movie.find params[:id]
    end
    
    def update
        @movie = Movie.find params[:id]
        @movie.update(movie_params)
        flash[:notice] = "#{@movie.title} was successfully updated."
        redirect_to movie_path(@movie)
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:notice] = "Movie '#{@movie.title}' deleted."
        redirect_to movies_path
    end

    def movies_with_good_reviews
        @movies = Movie.joins(:reviews).group(:movie_id).
          having('AVG(reviews.potatoes) > 3')
    end

    def movies_for_kids
        @movies = Movie.where('rating in ?', %w(G PG))
      
    end

    # using TMDb
    def search_tmdb
        @search_key = params[:search_key]
        @movies = Tmdb::Movie.find(@search_key)

        if @movies   # exist in tmdb
            render 'tmdb'
        else
            flash[:warning] = "'#{@search_key}' not found in TMDb"
        end
    end

    private 
        def movie_params
            params.require(:movie).permit(:title, :rating, :release_date, :description)
        end

    
end
