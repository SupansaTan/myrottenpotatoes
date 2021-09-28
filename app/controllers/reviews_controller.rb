class ReviewsController < ApplicationController
    before_action :has_user_and_movie , :only => [:new, :create, :edit, :update]

    public
    def new
      @review = Review.new
    end

    def create
      @review = Review.new(review_params)
      @review.movie_id = @movie.id
      @review.user_uid = @current_user.uid
      if @review.save(validate: false)
        flash[:notice] = "Review was successfully added"
        redirect_to movies_path
      else
        flash[:warning] = "Try again"
        render 'new'
      end
    end

    def edit
      @movie = Movie.find params[:movie_id]
      @review = Review.find params[:id]
    end

    def update
      @movie = Movie.find params[:movie_id]
      @review = Review.find params[:id]
      @review.assign_attributes(review_params) 

      if @review.save(validate: false)
        flash[:notice] = "Review was successfully updated."
        redirect_to movie_path(@movie)
      else
        render 'edit'
      end
    end

    private
      def review_params
        params.require(:review).permit(:potatoes, :comment)
      end

      def has_user_and_movie
        @movie = Movie.find(params[:movie_id])
        unless @current_user
          flash[:warning] = "Login before review"
          redirect_to movies_path
        end
      end
    
end