require 'rails_helper'

describe Movie do
  describe 'searching Tmdb by keyword' do
    context 'with valid API key' do
      # elided for brevity
    end
    context 'with invalid API key' do
      it 'raises an InvalidKeyError' do
        allow(Tmdb::Movie).to receive(:find).and_raise(Tmdb::InvalidApiKeyError)
        expect { Movie.find('Inception') }.
          to raise_error(Movie::InvalidKeyError)
      end
    end
  end
end