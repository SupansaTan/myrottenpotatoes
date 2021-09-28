class ReviewsController < ApplicationController
    before_action :has_movie, :only => [:new, :create]

    protected
    def has_movie
      unless (@movie = Movie.find_by_id(params[:movie_id]))
        flash[:warning] = 'Review must be for an existing movie.'
        redirect_to movies_path
      end
    end

    public
    def new
      @review = @movie.reviews.build
    end

    def create
      @current_user.reviews << @movie.reviews.build(params[:review])
      redirect_to movie_path(@movie)
    end

    def edit
      @movie = Movie.find params[:movie_id]
      @review = Review.find params[:id]
    end

    def update
      @movie = Movie.find params[:movie_id]
      @review = Review.find params[:id]

      if @review.update(review_params) 
        flash[:notice] = "Review was successfully updated."
        redirect_to movie_path(@movie)
      else
        render 'edit'
      end
    end

    private
    def review_params
      params.require(:review).permit(:potatoes)
    end
    
end