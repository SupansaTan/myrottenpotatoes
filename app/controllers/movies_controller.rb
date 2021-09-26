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
        render(:partial => 'movie_modal', :object => @movie) if request.xhr?
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            flash[:notice] = "#{@movie.title} was successfully created."
            redirect_to movie_path(@movie)
        else
            render 'new'
        end
    end

    def edit
        @movie = Movie.find params[:id]
    end
    
    def update
        @movie = Movie.find params[:id]
        if @movie.update(movie_params)
            flash[:notice] = "#{@movie.title} was successfully updated."
            redirect_to movie_path(@movie)
        else
            render 'edit'
        end
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:notice] = "Movie '#{@movie.title}' deleted."
        redirect_to movies_path
    end

    def movies_with_good_reviews
        @movies = Movie.joins(:reviews).group(:movie_id).having('AVG(reviews.potatoes) > 3')
    end

    def movies_for_kids
        @movies = Movie.where('rating in ?', %w(G PG))
    end

    # using TMDb
    def search_tmdb
        @search_terms = params[:search_terms]
        @movies = Movie.find_in_tmdb(@search_terms)

        if !@movies.empty?   # exist in tmdb
            render 'tmdb'
        else
            flash[:warning] = "Sorry, no results found for '#{@search_terms}'"
            redirect_to movies_path
        end
    end

    def create_from_tmdb
        movie_id = params[:tmdb_id]
        movie = Movie.get_from_tmdb(movie_id)

        @movie = Movie.new({
            :title => movie["title"],
            :rating => "G",
            :release_date => movie["release_date"],
            :description => movie["overview"],
            :poster_path => movie["poster_path"]
        })
        
        if @movie.save
            flash[:notice] = "'#{@movie.title}' was successfully created."
            redirect_to movies_path(@movie)
        end
    end

    private 
        def movie_params
            params.require(:movie).permit(:title, :rating, :release_date, :description)
        end

end
