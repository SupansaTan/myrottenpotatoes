class Movie < ActiveRecord::Base

  class Movie::InvalidKeyError < StandardError ; end

  def self.find(string)
    begin
      Tmdb::Movie.find(string)
    rescue Tmdb::InvalidApiKeyError
      raise Movie::InvalidKeyError, 'Invalid API key'
    end
  end
  # rest of file elided for brevity
end