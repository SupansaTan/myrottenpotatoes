require 'rails_helper'

describe MoviesController do
  describe 'searching TMDb' do
    before :each do
      @fake_results = [double('movie1'), double('movie2')]
    end
    it 'calls the model method that performs TMDb search' do
      expect(Movie).to receive(:find).with('hardware').
        and_return(@fake_results)
      post :search_tmdb, params: {:search_key => 'hardware'}
    end
    describe 'after valid search' do
      before :each do
        allow(Movie).to receive(:find).and_return(@fake_results)
        post :search_tmdb, params: {:search_key => 'hardware'}
      end
      it 'selects the Search Results template for rendering' do
        expect(response).to render_template('search_tmdb')
      end
      it 'makes the TMDb search results available to that template' do
        expect(assigns(:movies))==(@fake_results)
      end
    end
  end
end


   