class ReviewsController < ApplicationController
    before_action :has_user_and_movie, :only => [:new, :create, :edit, :update]    

    protected
    def has_user_and_movie
      unless @current_user
        flash[:warning] = 'You must be logged in before.'
        redirect_to movies_path
      end
      unless (@movie = Movie.find_by_id(params[:movie_id]))
        flash[:warning] = 'Review must be for an existing movie.'
        redirect_to movies_path
      end
    end

    public
    def new
      @movie = Movie.find(params[:movie_id])
      @review = @review || @movie.reviews.new
      @average_review = Movie.get_average_review(@movie.id)
      render(:partial => 'review_modal', :locals => {:movie => @movie, :review => @review}) if request.xhr?
    end

    def create
      @movie = Movie.find(params[:movie_id])
      @review = @movie.reviews.build(review_params)
      @review.user_id = @current_user.id                                  ##### delete this line when Login part can be use

      if @review.save(validate: false)
        flash[:notice] = "Review was successfully created."
        redirect_to movie_path(@movie)
      else
        flash[:notice] = "Try again"
        render 'new'
      end
    end

    def edit
      @movie = Movie.find params[:movie_id]
      @review = Review.find_by(movie_id:@movie.id, user_id:@current_user.id)
      @average_review = Movie.get_average_review(@movie.id)
      render(:partial => 'review_modal', :locals => {:movie => @movie, :review => @review}) if request.xhr?    
    end

    def update
      @movie = Movie.find params[:movie_id]
      @review = Review.find_by(movie_id:@movie.id, user_id:@current_user.id)     
      @review.update(review_params) 

      if @review.save(validate: false)
        flash[:notice] = "Review was successfully updated."
        redirect_to movie_path(@movie)
      else
        flash[:notice] = "Try again"
        render 'edit'
      end
    end

    private
    def review_params
      params.require(:review).permit(:potatoes)
    end
end