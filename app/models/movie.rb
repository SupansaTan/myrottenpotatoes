class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :users, :through => :reviews

  scope :with_good_reviews, lambda { |threshould|
    Movie.joins(:reviews).group(:movie_id).having('AVG(reviews.potatoes) > ?', threshold.to_i)
  }

  scope :for_kids, lambda {
    Movie.where('rating in (?)', %w(G PG))
  }
  
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date, :poster_path)
  end

  def self.all_ratings ; %w[G PG PG-13 R NC-17] ; end #  shortcut: array of strings

  validates :title, :presence => true
  validates :release_date, :presence => true
  validate :released_1930_or_later # uses custom validator below
  #validates :rating, :inclusion => {:in => Movie.all_ratings}, :unless => :grandfathered?

  def released_1930_or_later
    errors.add(:release_date, 'must be 1930 or later') if
    release_date && release_date < Date.parse('1 Jan 1930')
  end
  
  @@grandfathered_date = Date.parse('1 Nov 1968')
  def grandfathered?
    release_date && release_date < @@grandfathered_date
  end
  
  before_save :capitalize_title
  def capitalize_title
    self.title = self.title.split(/\s+/).map(&:downcase).
      map(&:capitalize).join(' ')
  end

  def self.get_average_review(id)
    movie = Movie.find(id)
    average = 0
    
    if movie.reviews.size > 0
      movie.reviews.each{ |review|
        average += review.potatoes
      }
      return average /= movie.reviews.size
    else
      return 'This movie has not been reviewed'
    end
  end

  class Movie::InvalidKeyError < StandardError; end

  def self.find_in_tmdb(string)
    begin
      Tmdb::Movie.find(string)
    rescue NoMethodError => tmdb_gem_exception
      if Tmdb::Api.response['code'] == '401'
        raise Movie::InvalidKeyError, 'Invalid API key'
      else
        raise tmdb_gem_exception
      end
    end
  end

  def self.get_from_tmdb(id)
    begin
      Tmdb::Movie.detail(id)
    rescue Tmdb::InvalidApiKeyError
      raise Movie::InvalidKeyError, 'Invalid API key'
    end
  end
end
