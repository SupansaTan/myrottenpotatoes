require 'rails_helper'

describe Movie do
  describe 'searching Tmdb by keyword' do
    context 'with valid API key' do
      it 'should call Tmdb with title keywords' do
        expect(Tmdb::Movie).to receive(:find).with('Inception')
        Movie.find_in_tmdb('Inception')
      end
    end

    context 'with invalid API key' do
      before :each do
        allow(Tmdb::Movie).to receive(:find).and_raise(NoMethodError)
        allow(Tmdb::Api).to receive(:response).and_return({'code' => '401'})
      end

      it 'should raise an InvalidKeyError with no API key' do
        expect { Movie.find_in_tmdb('Inception') }.
          to raise_error(Movie::InvalidKeyError)
      end
    end
  end
end