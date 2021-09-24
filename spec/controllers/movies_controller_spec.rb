require 'rails_helper'

describe MoviesController do
  describe 'searching TMDb' do
    before :each do
      @fake_results = [double('movie1'), double('movie2')]
    end

    it 'calls the model method that performs TMDb search' do
      expect(Movie).to receive(:find_in_tmdb).with('hardware').
        and_return(@fake_results)
      post :search_tmdb, params: {:search_terms => 'hardware'}
    end

    describe 'after valid search' do
      before :each do
        allow(Movie).to receive(:find_in_tmdb).and_return(@fake_results)
        post :search_tmdb, params: {:search_terms => 'hardware'}
      end

      it 'selects the Search Results template for rendering' do
        expect(response).to render_template('tmdb')
      end

      it 'makes the TMDb search results available to that template' do
        expect(assigns(:movies)).to eq(@fake_results)
      end
    end
  end
  describe 'create movie' do
    before :each do
      @movie_attr = {movie: {:title => 'test',rating: 'R',release_date: '2021-09-22',description: 'description'}}
    end
    it "creates new movie" do
      expect{
        post :create, params: @movie_attr
      }.to change(Movie,:count).by(1)
    end
    it "redirect to movie page" do
      post :create, params: @movie_attr
      expect(response).to redirect_to(Movie.last)
    end
  end
end
