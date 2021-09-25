class MoviesController < ApplicationController
    def index
       # movies = Movie.all
       # @sort_movies = movies.sort_by(&:title)
        sort = params[:sort] || session[:sort]
        case sort
        when 'title'
          ordering,@title_header = {:title => :asc}, 'hilite'
        when 'release_date'
         ordering,@date_header = {:release_date => :asc}, 'hilite'
        end
        @all_ratings = ['G', 'PG', 'PG-13', 'R' , 'NC-17']
        @selected_ratings = params[:ratings] || session[:ratings] || {}

        if @selected_ratings == {}
          @selected_ratings = Hash[@all_ratings.map {|rating| [rating, rating]}]
        end

        if params[:sort] != session[:sort] or params[:ratings] != session[:ratings]
         session[:sort] = sort
         session[:ratings] = @selected_ratings
        
       end
      @movies = Movie.where(rating: @selected_ratings.keys).order(:title)
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
            flash[:warning] = "'#{@search_terms}' not found in TMDb"
            redirect_to movies_path
        end
    end

    def create_from_tmdb
        movie_id = params[:tmdb_id]
        movie = Movie.get_from_tmdb(movie_id)

        @movie = Movie.new({
            :title => movie["title"],
            :rating => "",
            :release_date => movie["release_date"],
            :description => movie["overview"],
            :poster_path => movie["poster_path"]
        })

        if @movie.save
            flash[:notice] = "#{@movie.title} was successfully created."
            redirect_to movies_path(@movie)
        end
    end

    private 
        def movie_params
            params.require(:movie).permit(:title, :rating, :release_date, :description)
        end

end
