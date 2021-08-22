class MoviesController < ApplicationController
    def index
        movies = Movie.all
        @sort_movies = movies.sort_by(&:title)
    end

    def show
        id = params[:id]
        @movie = Movie.find(id)
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

    private 
        def movie_params
            params.require(:movie).permit(:title, :rating, :release_date, :description)
        end
end