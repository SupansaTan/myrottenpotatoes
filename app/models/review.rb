class Review < ActiveRecord::Base
    belongs_to :movie
    belongs_to :moviegoer
    attr_protected :moviegoer_id # see text

    # review is valid only if it's associated with a movie:
    validates :movie_id, :presence => true
    # can ALSO require that the referenced movie itself be valid
    #  in order for the review to be valid:
    validates_associated :movie
    
end